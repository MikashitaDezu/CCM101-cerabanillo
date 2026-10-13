# Multi-Tier Architecture

> **Deliverable:** Architecture overview for the CloudNova Nextcloud proof of concept.
> **Stack:** Nextcloud (web/application tier) and MariaDB (database tier), deployed with Docker Compose.

---

## What Is a Two-Tier Architecture?

A two-tier architecture splits an application into two layers that each do one job. The first layer handles everything your users see and interact with, and the second layer stores and manages the data behind it. For your Nextcloud private cloud, these two tiers run as separate containers that talk to each other over a private network created by Docker Compose.

---

## Architecture at a Glance

```mermaid
flowchart LR
    U["Your Users<br/>(Web Browser)"] -->|"HTTP on port 8080"| A["Web/Application Tier<br/>Nextcloud container"]
    A -->|"Private Compose network<br/>MYSQL_HOST=database"| D["Database Tier<br/>MariaDB container"]
```

---

## The Web/Application Tier

The web/application tier is the part of the system that your users actually reach. It serves the user interface, receives HTTP requests from browsers, runs the application logic, and decides what data to ask for or save. In this project, the Nextcloud container fills this role and is the only container published to users, on port 8080.

---

## The Database Tier

The database tier is responsible for persistent data. It stores user accounts, login credentials, and file metadata in an organized way so the web tier does not have to manage storage itself. In this project, the MariaDB container fills this role and has no published port, so only the Nextcloud container can reach it.

> **Note for your team:** This proof of concept does not define a named volume for the database. The data therefore does not reliably survive `docker-compose down`. A production deployment would add a volume to the database service.

---

## Tier Comparison

| Tier | Main Responsibility | Container in This Project |
|---|---|---|
| **Web/Application Tier** | This tier serves the user interface and handles every HTTP request from your users. | The Nextcloud container, which is reachable from the browser on port 8080. |
| **Database Tier** | This tier stores user accounts, credentials, and file metadata for the application. | The MariaDB container, which only the Nextcloud container connects to. |

---

## Why Separate Them?

Keeping the web server and the database in two separate containers means your team can update, restart, or scale one without disturbing the other. It also protects your data, because the database has no published port and only your application can talk to it. If one container fails, your team can fix just that piece instead of rebuilding your whole application.
