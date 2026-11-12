# CloudNova: Enterprise Cloud Architect

CCM101 Cloud Computing | University of Eastern Pangasinan

---

## Executive Summary

CloudNova is a cloud infrastructure project that demonstrates how to build, manage, and secure a web application on a virtual machine using Docker. An Ubuntu Server runs two connected services, WordPress for the website and MariaDB for its data. The system adds firewall protection, key-based remote access, persistent storage, and automatic daily database backups.

---

## Document Details

| Item | Detail |
|---|---|
| Course | CCM101 Cloud Computing |
| Institution | University of Eastern Pangasinan |
| Project | CloudNova |
| Application | WordPress with a MariaDB database |
| Environment | Ubuntu Server virtual machine on Oracle VirtualBox |

---

## Objectives

1. Set up a Linux server using Oracle VirtualBox.
2. Configure network connections between the laptop and the virtual machine.
3. Install Docker and Docker Compose.
4. Deploy WordPress and MariaDB as connected services.
5. Set up storage that keeps application and database data safe.
6. Protect the server with firewall rules and secure SSH access.
7. Create a Bash script for automatic database backups.
8. Schedule the backups with Cron.
9. Document the setup and maintenance procedures.

---

## System Architecture

| Layer | Component | Role |
|---|---|---|
| Host | Windows 11 laptop | Used to manage and access the server. |
| Virtualization | Oracle VirtualBox | Runs the Ubuntu Server virtual machine. |
| Operating system | Ubuntu Server | Hosts Docker and the application. |
| Network | NAT and Host-only adapters | NAT provides internet access, and Host-only networking connects the laptop to the server. |
| Firewall | UFW and Docker firewall rules | Control which incoming connections are accepted. |
| Containers | Docker | Runs and manages the application containers. |
| Website | WordPress | Serves the website. |
| Database | MariaDB | Stores the website's data. |
| Storage | Docker volumes | Keep application and database files when containers restart. |
| Automation | Bash and Cron | Create database backups automatically. |

Text overview of how the parts connect:

```text
Windows 11 laptop (192.168.56.1)
        |
        |  Host-only network 192.168.56.0/24
        v
Ubuntu Server VM (192.168.56.103)
  |-- Firewall: UFW and Docker firewall rules
  |-- Docker network: cloudnova-network
  |     |-- cloudnova-wordpress  (website on port 8080)
  |     |-- cloudnova-database   (MariaDB, internal network only)
  |-- Volumes: wordpress_data, mariadb_data
  |-- Backups: /opt/cloudnova/backups/ (Bash script scheduled with Cron)

NAT interface (10.0.2.15) provides the server's internet access.
```

The complete system diagram is available in [architecture-diagram.png](architecture-diagram.png).

---

## Technology Stack

| Component | Technology |
|---|---|
| Host operating system | Windows 11 |
| Virtualization software | Oracle VirtualBox |
| Server operating system | Ubuntu Server 26.04.1 LTS |
| Container platform | Docker Engine 29.9.2 |
| Container management | Docker Compose 5.6.1 |
| Website | WordPress |
| Database | MariaDB 11.4 |
| Firewall | UFW and iptables |
| Automation | Bash and Cron |
| Remote access | OpenSSH |
| SSH authentication | ED25519 key |

---

## Network Configuration

| Interface | IP Address | Purpose |
|---|---|---|
| NAT (`enp0s3`) | `10.0.2.15/24` | Provides internet access to the server. |
| Host-only (`enp0s8`) | `192.168.56.103/24` | Connects the laptop to the server. |
| Windows Host-only adapter | `192.168.56.1` | Connects the laptop to the server's network. |
| WordPress | `192.168.56.103:8080` | Provides access to the website. |

The WordPress website is available at `http://192.168.56.103:8080`.

---

## Docker Services

| Container | Image | Purpose |
|---|---|---|
| `cloudnova-wordpress` | `wordpress:latest` | Runs the website. |
| `cloudnova-database` | `mariadb:11.4` | Stores the website's data. |

Both containers communicate through the `cloudnova-network` Docker network.

### Persistent Storage

| Volume | Contents |
|---|---|
| `wordpress_data` | The WordPress files. |
| `mariadb_data` | The MariaDB database files. |

The MariaDB database port is not directly exposed to the host network.

---

## Security Controls

| Area | Control Applied |
|---|---|
| Incoming traffic | UFW is enabled with a default rule that blocks incoming connections. |
| Outgoing traffic | Outgoing connections are allowed. |
| SSH network access | SSH access is restricted to the Host-only network. |
| SSH authentication | Public-key authentication is enabled, and password login is disabled. |
| Root access | Root login through SSH is disabled. |
| Website access | Docker firewall rules restrict website access to the Windows host. |
| Database access | MariaDB is reachable only through the internal Docker network. |
| Secrets | Database passwords are stored in a protected `.env` file that is not included in the GitHub repository. |

---

## Backup Automation

A custom Bash script creates automatic MariaDB backups.

| Setting | Value |
|---|---|
| Script | `automation-script.sh` |
| Backup location | `/opt/cloudnova/backups/` |
| Schedule | Every day at 2:00 AM UTC, which is 10:00 AM Philippine Time |
| Retention | Seven days |

The script performs these tasks:

1. Creates a copy of the MariaDB database.
2. Compresses the backup with Gzip.
3. Adds the date and time to each backup filename.
4. Checks whether the backup file is valid.
5. Keeps backups for seven days.
6. Records the backup results in a log file.

---

## Repository Structure

```text
Laboratory-10-Enterprise-Cloud-Architect/
├── README.md
├── architecture-diagram.png
├── docker-compose.yml
├── automation-script.sh
├── operational-manual.md
└── final-reflection.md
```

---

## Basic Operation

| Command | Purpose |
|---|---|
| `cd /opt/cloudnova` | Moves into the project directory. |
| `sudo docker compose up -d` | Starts the application in the background. |
| `sudo docker ps` | Lists the running containers. |
| `sudo docker compose logs` | Shows the application logs. |

Once the containers are running, the website opens at `http://192.168.56.103:8080`. Complete setup, security, backup, and maintenance instructions are in [operational-manual.md](operational-manual.md).

---

## Deliverables

| File | Description |
|---|---|
| [architecture-diagram.png](architecture-diagram.png) | Shows the server setup and network connections. |
| [docker-compose.yml](docker-compose.yml) | Contains the WordPress and MariaDB configuration. |
| [automation-script.sh](automation-script.sh) | Creates automatic database backups. |
| [operational-manual.md](operational-manual.md) | Explains how to manage and maintain the system. |
| [final-reflection.md](final-reflection.md) | Discusses the lessons learned throughout CCM101. |

---

## Conclusion

CloudNova shows how virtualization, Docker, networking, storage, security, and automation work together in a single project. It delivers a working website with a connected database, protected access, and automatic backups.
