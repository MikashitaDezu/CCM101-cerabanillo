# Backup Script Guide

**CCM101 Cloud Computing | University of Eastern Pangasinan | Mission 9**

---

## Purpose

This guide documents the automated backup built for CloudNova Technologies. It is written so your IT team can read the script, understand what each part does, and see exactly when the backup runs. The goal is to remove the human step that caused last month's data loss.

---

## The Script: `backup.sh`

```bash
#!/bin/bash
# Automated Backup Script for CloudNova Technologies

SOURCE_DIR="app-data"
BACKUP_DIR="backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

echo "Initiating automated backup..."

# Create the backup directory if it does not exist
mkdir -p $BACKUP_DIR

# Compress the source directory into a tarball (.tar.gz)
tar -czf $BACKUP_DIR/backup_$TIMESTAMP.tar.gz $SOURCE_DIR

echo "Backup completed successfully at $TIMESTAMP!"
```

---

## What Each Part of the Script Does

| Command | What It Did |
|---|---|
| `#!/bin/bash` | Told the system to run the file with the Bash interpreter. |
| `SOURCE_DIR="app-data"` | Stored the name of the folder that holds your application data. |
| `BACKUP_DIR="backups"` | Stored the name of the folder where finished backups are saved. |
| `TIMESTAMP=$(date +"%Y%m%d_%H%M%S")` | Captured the current date and time, such as `20261019_013219`, to make each backup name unique. |
| `echo "Initiating automated backup..."` | Printed a message so the person or log reading the output knows the backup started. |
| `mkdir -p $BACKUP_DIR` | Created the `backups` folder if it was missing and did nothing if it already existed. |
| `tar -czf $BACKUP_DIR/backup_$TIMESTAMP.tar.gz $SOURCE_DIR` | Compressed the `app-data` folder into a time-stamped `.tar.gz` file inside `backups`. |
| `echo "Backup completed successfully at $TIMESTAMP!"` | Printed a confirmation message with the time of the backup. |

---

## What `chmod +x` Did to the File

The `chmod +x backup.sh` command adds the execute permission to the script, which tells Linux that your team is allowed to run this file as a program. Before the change, the file could only be read and edited, and running it produced a `Permission denied` error. After the change, the permissions went from `-rw-r--r--` to `-rwxr-xr-x`, and the script ran successfully. Linux requires this step by default so that a plain text file cannot be run as a program by accident.

| Stage | Permissions | Result |
|---|---|---|
| **Before `chmod +x`** | `-rw-r--r--` | Running `./backup.sh` returned `bash: ./backup.sh: Permission denied`. |
| **After `chmod +x`** | `-rwxr-xr-x` | Running `./backup.sh` completed the backup successfully. |

---

## The Cron Expression

```
0 2 * * * /root/backup.sh
```

This single line is the schedule. The first five fields set when the job runs, and the last part is the command to run.

| Field | Position | Allowed Values | Value Used | What It Means |
|---|---|---|---|---|
| **Minute** | 1st | 0 to 59 | `0` | The job starts at minute zero, which is the top of the hour. |
| **Hour** | 2nd | 0 to 23 | `2` | The job starts during hour 2 on a 24-hour clock, which is 2:00 AM. |
| **Day of Month** | 3rd | 1 to 31 | `*` | The asterisk means every day of the month. |
| **Month** | 4th | 1 to 12 | `*` | The asterisk means every month of the year. |
| **Day of Week** | 5th | 0 to 7 (0 and 7 are Sunday) | `*` | The asterisk means every day of the week. |
| **Command** | After the 5 fields | A file path or command | `/root/backup.sh` | The full path of the script that cron runs when the time matches. |

Read together, the line means "at minute 0 of hour 2, on every day of every month, run `/root/backup.sh`".

---

## What This Means for Your Team

Your team does not need to press anything for this backup to run. Every night at 2:00 AM, the cron service starts `/root/backup.sh`, which compresses the `app-data` folder into a new time-stamped file inside `backups`. Because the name of each file includes the date and time, a new backup never overwrites an older one. Your team can check the results the next morning by listing the `backups` folder.

---

## Evidence

### Script Execution and Backup File

![Terminal showing the permission denied error, chmod, the script running, and the backup file listed in the backups folder](screenshots/script-execution.png)

The first run failed with `Permission denied`. After `chmod +x`, the script printed both messages and created `backup_20261019_013219.tar.gz` in the `backups` folder.

### Installed Cron Schedule

![Terminal showing crontab installing the new schedule and the crontab -l output ending with the 2:00 AM job](screenshots/cron-schedule.png)

The schedule was installed with `env EDITOR=nano crontab -e`, and `systemctl is-active cron` confirmed that the cron service was `active`.

---

## Notes for Your Team

- **Relative paths:** the script uses `app-data` and `backups` without full paths, so it expects to run from `/root`, where those folders were created. Cron starts jobs for root in `/root`, so this works here, but moving the script or the folders would break it.
- **Same-machine storage:** the backups are saved on the same server as the data. A production setup should also copy them to a separate location.
- **No cleanup:** the script never deletes old backups, so the `backups` folder will keep growing until someone removes old files.
- **Time zone:** cron uses the server's own clock, so "2:00 AM" means 2:00 AM in the server's time zone.
- **Lab limit:** this was built in a temporary KillerCoda session. I confirmed that the schedule was installed and the cron service was active, but I did not wait to watch the job run at 2:00 AM.
