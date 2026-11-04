# Automation Research: The Language of Automation

**CCM101 Cloud Computing | University of Eastern Pangasinan | Mission 9**

Before writing the backup script for CloudNova Technologies, I defined the three tools this lab depends on. Each concept below is explained in my own words.

---

## Bash Script

A Bash script is a plain text file that holds a list of Linux commands, which the Bash shell runs from top to bottom so a whole routine can be started with one command. The first line, `#!/bin/bash`, is called the shebang, and it tells the system to use the Bash program at `/bin/bash` to read and run the rest of the file. Without it, the file could be run by a different shell that does not understand every command in it.

---

## Variables

A variable stores a value under a name, such as `BACKUP_DIR="backups"`, and the script reads that value back by writing `$BACKUP_DIR`. Programmers use variables so a folder path is typed once at the top and reused everywhere, which means changing the folder later takes one edit instead of a search through every line. This also lowers the chance of a typo in a path, which matters when a script runs without anyone watching it.

---

## Cron Job

Cron is the Linux scheduler that runs in the background and starts commands at times listed in a file called the crontab, and a cron job is one scheduled line in that file. It is essential for cloud operations because servers need routine work such as backups, log cleanup, and updates to happen on a fixed schedule even when nobody is logged in. It removes the human step from that work, which is exactly the failure the client had when their staff forgot to run backups.

---

## Quick Reference

| Concept | Example From This Lab | Why It Matters Here |
|---|---|---|
| **Bash Script** | `backup.sh` starts with `#!/bin/bash`. | It turns several manual backup commands into one repeatable file. |
| **Variables** | `SOURCE_DIR`, `BACKUP_DIR`, and `TIMESTAMP` hold the paths and the time. | Each value is defined once and reused, so the script is easier to read and change. |
| **Cron Job** | `0 2 * * * /root/backup.sh` runs the script every night at 2:00 AM. | The backup happens on schedule without anyone pressing a button. |
