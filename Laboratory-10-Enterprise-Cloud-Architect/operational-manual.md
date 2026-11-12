# CloudNova Operational Manual

**CCM101 Cloud Computing | University of Eastern Pangasinan | Mission 10: Enterprise Cloud Architect**

This manual explains how to deploy, secure, and maintain CloudNova. It is written as a handover document for the client's IT team.

---

## Quick Reference

### System at a Glance

| Item | Value |
|---|---|
| Application | WordPress with a MariaDB 11.4 database |
| Server | Ubuntu Server 26.04.1 LTS on Oracle VirtualBox |
| Website address | `http://192.168.56.103:8080` |
| Project directory | `/opt/cloudnova/` |
| Containers | `cloudnova-wordpress`, `cloudnova-database` |
| Persistent volumes | `wordpress_data`, `mariadb_data` |
| Firewall | UFW (default deny incoming) plus Docker firewall rules |
| SSH access | ED25519 key only, Host-only network only |
| Backup schedule | Daily at 2:00 AM UTC (10:00 AM Philippine Time) |
| Backup location | `/opt/cloudnova/backups/` (7-day retention) |
| Backup log | `/var/log/cloudnova-backup.log` |

### Common Tasks

| Task | Command | Section |
|---|---|---|
| Connect to the server | `ssh -i "$env:USERPROFILE\.ssh\cloudnova_ed25519" cloudnova@192.168.56.103` | 3.3 |
| Start the application | `cd /opt/cloudnova && sudo docker compose up -d` | 4.5 |
| Check container status | `sudo docker compose ps` | 4.5 |
| View application logs | `sudo docker compose logs -f` | 4.8 |
| Check the firewall | `sudo ufw status verbose` | 6.1 |
| Run a manual backup | `sudo /usr/local/sbin/cloudnova-db-backup.sh` | 7.4 |
| Check the backup log | `sudo tail -n 50 /var/log/cloudnova-backup.log` | 7.8 |
| Restore a backup | See the restore procedure | 8 |

---

## 1. Introduction

CloudNova is a website hosted on Ubuntu Server inside Oracle VirtualBox. It uses Docker to run two connected containers: WordPress for the website and MariaDB for its database.

This guide contains the commands and instructions needed to deploy the stack, manage the server, protect access, and create and restore database backups.

> [!NOTE]
> The IP addresses, usernames, and file names in this manual describe one specific deployment. Replace them with the values used in your own environment.

---

## 2. System Requirements

### Host Machine

- Windows 11
- Oracle VirtualBox
- SSH client
- Web browser
- Internet connection

### Virtual Machine

- Ubuntu Server 26.04.1 LTS
- 35 GB dynamically allocated virtual disk
- Docker Engine
- Docker Compose
- UFW firewall
- OpenSSH Server

### Application Components

- WordPress
- MariaDB 11.4
- Docker network
- Docker storage volumes

---

## 3. Server and Network Setup

### 3.1 Virtual Machine Information

The Ubuntu Server runs inside Oracle VirtualBox.

| Configuration | Value |
|---|---|
| Server name | `cloudnova-server` |
| Linux user | `cloudnova` |
| Operating system | Ubuntu Server 26.04.1 LTS |
| Virtualization software | Oracle VirtualBox |
| Virtual disk | 35 GB |

### 3.2 Network Configuration

The server uses two network adapters.

| Interface | IP Address | Purpose |
|---|---|---|
| `enp0s3` (NAT) | `10.0.2.15` | Internet access |
| `enp0s8` (Host-only) | `192.168.56.103` | Laptop-to-server connection |

The Windows laptop uses `192.168.56.1` on its Host-only network adapter. To find the server's addresses, run `ip addr` on the server.

### 3.3 Connecting to the Server

Open Windows PowerShell and run:

```powershell
ssh -i "$env:USERPROFILE\.ssh\cloudnova_ed25519" cloudnova@192.168.56.103
```

Enter the SSH key passphrase if requested.

To open the WordPress website, enter this address in a browser on the host laptop:

```text
http://192.168.56.103:8080
```

---

## 4. Deploying the Docker Application

### 4.1 Installing Docker

Install Docker Engine and the Docker Compose plugin from Docker's official apt repository. Follow the current instructions at <https://docs.docker.com/engine/install/ubuntu/>. The packages needed are `docker-ce`, `docker-ce-cli`, `containerd.io`, `docker-buildx-plugin`, and `docker-compose-plugin`.

Verify the installation:

```bash
sudo docker --version
sudo docker compose version
```

### 4.2 Project Location

The CloudNova project is stored in:

```text
/opt/cloudnova/
```

The deployed configuration file is named `compose.yaml`. Its copy in this repository is named `docker-compose.yml`.

### 4.3 Creating the Environment File

Database settings are kept in a separate `.env` file so that passwords are never written into the Compose file. Create it at `/opt/cloudnova/.env`:

```text
DB_ROOT_PASSWORD=<strong root password>
DB_NAME=<database name>
DB_USER=<database user>
DB_PASSWORD=<strong user password>
```

Restrict access to the file:

```bash
sudo chmod 600 /opt/cloudnova/.env
```

### 4.4 Application Containers

CloudNova has two containers connected by the `cloudnova-network` Docker network.

**WordPress**

- Container name: `cloudnova-wordpress`
- Image: `wordpress:latest`
- Website address: `192.168.56.103:8080`
- Storage: `wordpress_data`

**MariaDB**

- Container name: `cloudnova-database`
- Image: `mariadb:11.4`
- Database settings: stored in `.env`
- Storage: `mariadb_data`
- Access: internal Docker network only

WordPress starts only after MariaDB passes its health check.

### 4.5 Starting the Application

Connect to the server and run:

```bash
cd /opt/cloudnova
sudo docker compose up -d
```

Check that the containers are running:

```bash
sudo docker ps
sudo docker compose ps
```

Open `http://192.168.56.103:8080` in the host browser and complete the WordPress setup.

### 4.6 Verifying Persistent Storage

After the WordPress setup is complete, confirm that data survives a restart:

```bash
sudo reboot
```

When the server is back online, reconnect and check that the containers started automatically and the website still shows the same content:

```bash
sudo docker ps
```

### 4.7 Stopping and Restarting the Application

Stop the application:

```bash
cd /opt/cloudnova
sudo docker compose stop
```

Start the application again:

```bash
sudo docker compose start
```

Restart the containers:

```bash
sudo docker compose restart
```

Remove the containers and network without deleting the stored data:

```bash
sudo docker compose down
```

> [!IMPORTANT]
> Avoid using `docker compose down -v` unless you intentionally want to delete the stored data inside the Docker volumes.

### 4.8 Checking Application Logs

WordPress logs:

```bash
sudo docker logs cloudnova-wordpress
```

MariaDB logs:

```bash
sudo docker logs cloudnova-database
```

View the logs continuously:

```bash
sudo docker compose logs -f
```

---

## 5. Data Storage

CloudNova uses Docker volumes to keep website and database files when containers are restarted or recreated.

| Volume | Container Path | Purpose |
|---|---|---|
| `wordpress_data` | `/var/www/html` | Stores WordPress files |
| `mariadb_data` | `/var/lib/mysql` | Stores database files |

List the available volumes:

```bash
sudo docker volume ls
```

Inspect the MariaDB volume:

```bash
sudo docker volume inspect mariadb_data
```

These volumes prevent data loss when containers are stopped or recreated. They are not a replacement for separate database backups, which are covered in Section 7.

---

## 6. Security Configuration

### 6.1 UFW Firewall

The Ubuntu firewall blocks incoming connections by default.

Set the default rules:

```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
```

Allow SSH access from the Host-only network:

```bash
sudo ufw allow from 192.168.56.0/24 to any port 22 proto tcp
```

Enable the firewall:

```bash
sudo ufw enable
```

Check the firewall:

```bash
sudo ufw status verbose
```

The WordPress port is controlled separately using Docker firewall rules (Section 6.3), because Docker-published ports can bypass normal UFW filtering.

### 6.2 SSH Security

SSH uses a private and public key pair instead of password login.

The server security settings are:

```text
PermitRootLogin no
PubkeyAuthentication yes
PasswordAuthentication no
KbdInteractiveAuthentication no
MaxAuthTries 3
X11Forwarding no
AllowUsers cloudnova
```

Configuration file:

```text
/etc/ssh/sshd_config.d/99-security.conf
```

Check whether the SSH configuration is valid:

```bash
sudo sshd -t
```

View the active SSH settings:

```bash
sudo sshd -T
```

Reload SSH after changing the configuration:

```bash
sudo systemctl reload ssh
```

> [!IMPORTANT]
> Keep your current SSH session open while testing new SSH settings. If a setting is incorrect, you can still fix it instead of losing access to the server.

### 6.3 Docker Firewall Rules

Docker has its own firewall rules to control access to the WordPress website. The current configuration:

1. Allows existing connections to continue.
2. Allows the Windows host (`192.168.56.1`) to reach WordPress through the Host-only interface.
3. Blocks other traffic aimed at the published WordPress port.

Check the rules:

```bash
sudo iptables -S DOCKER-USER
```

The firewall script is located at:

```text
/usr/local/sbin/cloudnova-docker-firewall.sh
```

The service configuration is located at:

```text
/etc/systemd/system/cloudnova-docker-firewall.service
```

Check the service:

```bash
sudo systemctl status cloudnova-docker-firewall
```

### 6.4 Protecting Database Passwords

Database credentials are stored in:

```text
/opt/cloudnova/.env
```

Check the file permissions:

```bash
sudo ls -l /opt/cloudnova/.env
```

> [!WARNING]
> Security reminders:
>
> - Never upload `.env` to GitHub.
> - Never share database passwords publicly.
> - Do not expose MariaDB port 3306 to the host network.
> - Keep the `.env` file protected.

WordPress connects to MariaDB through the internal Docker network using the service name `database`.

---

## 7. Automatic Database Backup

### 7.1 Backup Script

The copy of the script in this repository is `automation-script.sh`. On the server it is installed at:

```text
/usr/local/sbin/cloudnova-db-backup.sh
```

The script performs these tasks:

1. Reads the database settings from `.env`.
2. Checks whether the MariaDB container is running.
3. Exports the database.
4. Compresses the export with Gzip.
5. Checks whether the archive is valid.
6. Saves the backup with a date and time in its filename.
7. Deletes backup files older than seven days.

If any step fails, the script stops and removes the incomplete backup file.

### 7.2 Installing the Script

Create the backup folder, copy the script into place, and make it executable:

```bash
sudo mkdir -p /opt/cloudnova/backups
sudo chmod 700 /opt/cloudnova/backups
sudo cp automation-script.sh /usr/local/sbin/cloudnova-db-backup.sh
sudo chown root:root /usr/local/sbin/cloudnova-db-backup.sh
sudo chmod 750 /usr/local/sbin/cloudnova-db-backup.sh
```

### 7.3 Backup Location

All backup files are stored in:

```text
/opt/cloudnova/backups/
```

List the backup files:

```bash
sudo ls -lh /opt/cloudnova/backups/
```

### 7.4 Creating a Manual Backup

Run:

```bash
sudo /usr/local/sbin/cloudnova-db-backup.sh
```

A successful backup displays:

```text
SUCCESS: Database backup created.
File: /opt/cloudnova/backups/...
Size: ...
```

### 7.5 Checking Backup Files

Run:

```bash
sudo bash -c 'gzip -t "$(ls -t /opt/cloudnova/backups/*.sql.gz | head -n 1)" && echo "Backup archive is valid."'
```

If the message `Backup archive is valid.` appears, the newest backup passed the integrity check.

### 7.6 Automatic Backup Schedule

The backup runs every day at 2:00 AM UTC, which is 10:00 AM Philippine Time. The schedule is set in the root user's Cron table.

Open the Cron table:

```bash
sudo crontab -e
```

The scheduled entry is:

```cron
0 2 * * * /usr/local/sbin/cloudnova-db-backup.sh >> /var/log/cloudnova-backup.log 2>&1
```

Cron uses the server's time zone. Confirm it with `timedatectl` and adjust the hour if the server is not set to UTC.

### 7.7 Checking the Scheduled Task

Display the scheduled task:

```bash
sudo crontab -l
```

Check whether Cron is running:

```bash
sudo systemctl status cron
```

### 7.8 Checking Backup Logs

The backup log is stored at:

```text
/var/log/cloudnova-backup.log
```

View the log:

```bash
sudo cat /var/log/cloudnova-backup.log
```

View the latest entries:

```bash
sudo tail -n 50 /var/log/cloudnova-backup.log
```

---

## 8. Restoring a Database Backup

A compressed SQL backup can be used to restore the MariaDB database.

> [!WARNING]
> Restoring a backup can replace the current database contents. Make a separate copy of the current database before you proceed.

Load the database settings:

```bash
cd /opt/cloudnova

set -a
source .env
set +a
```

Set the backup filename:

```bash
BACKUP_FILE="/opt/cloudnova/backups/your_backup_filename.sql.gz"
```

Replace `your_backup_filename.sql.gz` with the actual backup filename.

Restore the database:

```bash
sudo bash -c 'gunzip -c "$1" | docker exec -i -e MYSQL_PWD="$2" cloudnova-database mariadb -u root "$3"' _ "$BACKUP_FILE" "$DB_ROOT_PASSWORD" "$DB_NAME"
```

Check the MariaDB logs:

```bash
sudo docker logs --tail 50 cloudnova-database
```

Then reload the website in a browser and confirm that the content has returned. A backup should be test-restored from time to time to confirm that it works.

---

## 9. Maintenance and Troubleshooting

The following commands help check the server and fix common problems.

### 9.1 Check Running Containers

```bash
sudo docker ps -a
```

### 9.2 Restart Docker

```bash
sudo systemctl restart docker
```

### 9.3 Check Available Disk Space

```bash
df -h
```

### 9.4 Check Memory Usage

```bash
free -h
```

### 9.5 Check Network Settings

```bash
ip addr
ip route
```

### 9.6 Check Firewall Rules

```bash
sudo ufw status verbose
sudo iptables -S DOCKER-USER
```

### 9.7 Check the Docker Firewall Service

```bash
sudo systemctl status cloudnova-docker-firewall
```

### 9.8 Check Backup Logs

```bash
sudo tail -n 50 /var/log/cloudnova-backup.log
```

### 9.9 Common Problems

| Problem | Possible Cause | Solution |
|---|---|---|
| WordPress cannot be accessed | Container is stopped or network is not working | Check container status and network settings |
| WordPress cannot connect to MariaDB | Database is not running or is not healthy | Check MariaDB status and logs |
| SSH connection is denied | Wrong key or incorrect SSH settings | Check the SSH key and server configuration |
| Backup script fails | Database is unavailable, settings are missing, or the backup folder does not exist | Check MariaDB, `.env`, and `/opt/cloudnova/backups/` |
| Server storage is full | Too many files or backups | Check disk usage and old backup files |
| Website cannot be accessed from Windows | Incorrect firewall rules or Host-only network settings | Check the Docker firewall rules and network interfaces |

---

## 10. Important Maintenance Reminders

- Keep database passwords private.
- Never upload `.env` to GitHub.
- Keep MariaDB accessible only through the internal Docker network.
- Do not disable firewall rules without understanding their purpose.
- Check backup files regularly.
- Keep another copy of important backups outside the virtual machine.
- Avoid deleting Docker volumes without checking their contents.
- Check available disk space regularly.
- Review application updates before applying them.

---

## 11. Conclusion

This manual contains the main instructions for deploying and managing CloudNova. Following these procedures keeps the website running, protects server access, preserves important data, and ensures that database backups are created and can be restored.
