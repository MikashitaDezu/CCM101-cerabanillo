# CloudNova Operational Manual

This manual explains how to set up, run, secure, and maintain CloudNova.

---

## Table of Contents

1. [Introduction](#1-introduction)
2. [System Requirements](#2-system-requirements)
3. [Server and Network Setup](#3-server-and-network-setup)
4. [Running the Docker Application](#4-running-the-docker-application)
5. [Data Storage](#5-data-storage)
6. [Security Configuration](#6-security-configuration)
7. [Automatic Database Backup](#7-automatic-database-backup)
8. [Restoring a Database Backup](#8-restoring-a-database-backup)
9. [Maintenance and Troubleshooting](#9-maintenance-and-troubleshooting)
10. [Important Maintenance Reminders](#10-important-maintenance-reminders)
11. [Conclusion](#11-conclusion)

---

## 1. Introduction

CloudNova is a website hosted on Ubuntu Server inside Oracle VirtualBox. It uses Docker to run WordPress and MariaDB.

This guide contains the commands and instructions needed to manage the server, check the application, protect access, and create database backups.

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
- UFW Firewall
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
| Server Name | `cloudnova-server` |
| Linux User | `cloudnova` |
| Operating System | Ubuntu Server 26.04.1 LTS |
| Virtualization Software | Oracle VirtualBox |
| Virtual Disk | 35 GB |

### 3.2 Network Configuration

The server uses two network connections.

| Interface | IP Address | Purpose |
|---|---|---|
| `enp0s3` | `10.0.2.15` | Internet access |
| `enp0s8` | `192.168.56.103` | Laptop-to-server connection |

The Windows laptop uses `192.168.56.1` for its Host-only network connection.

### 3.3 Connecting to the Server

Open Windows PowerShell and run:

```powershell
ssh -i "$env:USERPROFILE\.ssh\cloudnova_ed25519" cloudnova@192.168.56.103
```

Enter your SSH key passphrase if requested.

To open the WordPress website, enter this address in your browser:

```text
http://192.168.56.103:8080
```

---

## 4. Running the Docker Application

### 4.1 Checking Docker Installation

Check the Docker version:

```bash
sudo docker --version
```

Check the Docker Compose version:

```bash
sudo docker compose version
```

### 4.2 Project Location

The CloudNova project is stored in:

```text
/opt/cloudnova/
```

The deployed configuration file is named `compose.yaml`. Its GitHub copy is named `docker-compose.yml`.

### 4.3 Application Containers

CloudNova has two main containers.

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
- Access: Internal Docker network only

### 4.4 Starting the Application

Connect to Ubuntu Server and run:

```bash
cd /opt/cloudnova
sudo docker compose up -d
```

Check whether the containers are running:

```bash
sudo docker ps
```

Check the application services:

```bash
sudo docker compose ps
```

### 4.5 Stopping and Restarting the Application

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

### 4.6 Checking Application Logs

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

CloudNova uses Docker volumes to keep website and database files even when containers are restarted or recreated.

| Volume | Storage Location | Purpose |
|---|---|---|
| `wordpress_data` | `/var/www/html` | Stores WordPress files |
| `mariadb_data` | `/var/lib/mysql` | Stores database files |

List the available volumes:

```bash
sudo docker volume ls
```

Check the MariaDB volume:

```bash
sudo docker volume inspect mariadb_data
```

These volumes help prevent data loss when containers are stopped or recreated. However, they are not a replacement for separate database backups.

---

## 6. Security Configuration

### 6.1 UFW Firewall

The Ubuntu firewall blocks incoming connections by default.

Set the firewall rules:

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

The WordPress port is controlled separately using Docker firewall rules because Docker-published ports can bypass normal UFW filtering.

### 6.2 SSH Security

SSH is configured to use a private and public key pair instead of password login.

The server security settings include:

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

Reload SSH after making configuration changes:

```bash
sudo systemctl reload ssh
```

> [!IMPORTANT]
> Keep your current SSH session open while testing new SSH settings. This helps prevent losing access to the server if a configuration is incorrect.

### 6.3 Docker Firewall Rules

Docker has its own firewall rules to control access to the WordPress website.

The current configuration:

1. Allows existing connections to continue.
2. Allows the Windows host (`192.168.56.1`) to access WordPress through the Host-only interface.
3. Blocks other traffic targeting the published WordPress port.

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
> - Do not expose
