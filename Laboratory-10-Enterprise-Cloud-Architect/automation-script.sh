#!/bin/bash

set -Eeuo pipefail
umask 077

PROJECT_DIR="/opt/cloudnova"
BACKUP_DIR="/opt/cloudnova/backups"
CONTAINER="cloudnova-database"

# Load database configuration
set -a
source "$PROJECT_DIR/.env"
set +a

# Validate required configuration
: "${DB_NAME:?DB_NAME is missing}"
: "${DB_USER:?DB_USER is missing}"
: "${DB_PASSWORD:?DB_PASSWORD is missing}"

# Generate timestamped backup filename
TIMESTAMP=$(date -u +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/${DB_NAME}_${TIMESTAMP}.sql.gz"
TEMP_FILE="${BACKUP_FILE}.tmp"

# Remove incomplete backup if an error occurs
trap 'rm -f "$TEMP_FILE"' ERR

# Verify database container is running
if ! docker inspect -f '{{.State.Running}}' "$CONTAINER" | grep -qx true; then
    echo "ERROR: Database container is not running."
    exit 1
fi

# Export and compress the database
docker exec -e MYSQL_PWD="$DB_PASSWORD" "$CONTAINER" \
    mariadb-dump \
    --single-transaction \
    --routines \
    --triggers \
    --events \
    --user="$DB_USER" \
    "$DB_NAME" | gzip > "$TEMP_FILE"

# Verify backup archive
gzip -t "$TEMP_FILE"

# Save completed backup
mv "$TEMP_FILE" "$BACKUP_FILE"

# Retain backups for seven days
find "$BACKUP_DIR" -type f -name '*.sql.gz' -mmin +10080 -delete

echo "SUCCESS: Database backup created."
echo "File: $BACKUP_FILE"
echo "Size: $(du -h "$BACKUP_FILE" | cut -f1)"