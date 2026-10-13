<div align="center">

# Docker Compose Guide

**Laboratory 6: Cloud Deployment Engineer**
CCM101 Cloud Computing | University of Eastern Pangasinan

</div>

---

## Guide Summary

| Field | Details |
| :--- | :--- |
| **Purpose** | Explain the Compose file so another engineer can understand and repeat the deployment |
| **Stack** | Nextcloud (`app`) and MariaDB 11.8 (`database`) |
| **Compose Version** | Docker Compose 1.29.2 (standalone `docker-compose`) |
| **Published Port** | `8080` mapped to container port `80` |
| **Environment** | KillerCoda Ubuntu 24.04 Playground |

> [!NOTE]
> Two values differ from the lab specification: the database image (`mariadb:11.8` instead of `mariadb:10.6`) and the omitted `version` line. Both are explained in Section 7.

---

## 1. The Compose File

```yaml
services:
  database:
    image: mariadb:11.8
    environment:
      - MYSQL_ROOT_PASSWORD=cloudnova_root
      - MYSQL_PASSWORD=cloudnova_pass
      - MYSQL_DATABASE=nextcloud_db
      - MYSQL_USER=nextcloud_user

  app:
    image: nextcloud
    ports:
      - 8080:80
    environment:
      - MYSQL_PASSWORD=cloudnova_pass
      - MYSQL_DATABASE=nextcloud_db
      - MYSQL_USER=nextcloud_user
      - MYSQL_HOST=database
```

> [!WARNING]
> The passwords in this file are sample values for a lab proof of concept. A production deployment would keep real secrets outside the Compose file.

---

## 2. The `services:` Block

The `services:` block is the top-level section that lists every container the application needs. Each entry under it, here `database` and `app`, describes one container, including its image, environment variables, and published ports. When Compose reads the file, it creates and starts one container for each entry. The name of each entry also becomes that container's hostname on the stack's private network.

| Service | Image | Role | Published Port |
| :--- | :--- | :--- | :--- |
| **database** | `mariadb:11.8` | Stores user accounts and file metadata for Nextcloud. | None, so it can only be reached from inside the stack. |
| **app** | `nextcloud` | Serves the Nextcloud web interface to the browser. | Port 8080 on the host is mapped to port 80 in the container. |

---

## 3. How the App Container Finds the Database

The app container finds the database through the `MYSQL_HOST=database` environment variable. When the stack starts, Compose creates a private network named `nextcloud-deployment_default` and attaches both containers to it. On that network, each service name works as a hostname, so the name `database` resolves to the MariaDB container without any IP address being written into the file.

The three shared values, `MYSQL_DATABASE`, `MYSQL_USER`, and `MYSQL_PASSWORD`, must match in both services. The database container uses them to create the account, and the app container uses them to log in with it. The `docker-compose ps` output also shows that the database listens only on `3306/tcp` inside the stack and is not published to the host.

---

## 4. `docker run` Compared with `docker-compose up -d`

| Topic | `docker run` | `docker-compose up -d` |
| :--- | :--- | :--- |
| **What it starts** | One container per command, so a two-tier stack needs two separate commands. | Every service in the Compose file, with a single command. |
| **Where configuration lives** | Ports, variables, and names are typed as flags and are easy to forget or mistype. | All configuration is written down in `docker-compose.yml`. |
| **Networking** | The engineer creates a network and attaches each container by hand so they can find each other. | Compose creates a shared network automatically and lets services reach each other by name. |
| **Repeatability** | Repeating the deployment means retyping the commands exactly. | Repeating the deployment means running the same file again and getting the same result. |
| **Cleanup** | Each container is stopped and removed one at a time. | `docker-compose down` stops and removes the containers and the network together. |

---

## 5. Environment Variable Reference

| Variable | Used By | Function |
| :--- | :--- | :--- |
| `MYSQL_ROOT_PASSWORD` | database | Sets the administrator password for the MariaDB server. |
| `MYSQL_DATABASE` | database and app | Names the database that Nextcloud stores its data in. |
| `MYSQL_USER` | database and app | Names the database account that Nextcloud connects with. |
| `MYSQL_PASSWORD` | database and app | Sets and supplies the password for that database account. |
| `MYSQL_HOST` | app | Tells Nextcloud which hostname to connect to, which is the `database` service. |

---

## 6. Deployment and Teardown Commands

| Command | What It Did |
| :--- | :--- |
| `docker-compose up -d` | Pulled both images, created the network, and started both containers in the background. |
| `docker-compose ps` | Listed the stack's containers and showed that both were in the Up state. |
| `docker-compose down` | Stopped and removed both containers and the stack's network. |

---

## 7. Deviations from the Lab Specification

| Item | Specification | Actual | Reason |
| :--- | :--- | :--- | :--- |
| **MariaDB image** | `mariadb:10.6` | `mariadb:11.8` | MariaDB 10.6 reached end of life on 6 July 2026, and Nextcloud 35 no longer supports it, so a currently supported release was used. |
| **Version line** | `version: '3'` | Line omitted | The `version` line is optional in the Compose specification, and `docker-compose config` filled in a default value automatically. |

The KillerCoda Ubuntu 24.04 machine did not recognize `docker compose` (with a space). It has the standalone `docker-compose` command, version 1.29.2, so every Compose command in this lab uses the hyphenated form.

---

## 8. Evidence

<div align="center">

**Figure 1.** Stack deployment output and running containers

![Docker Compose deployment output and running containers](screenshots/compose-deployment.png)

**Figure 2.** Nextcloud setup page on port 8080

![Nextcloud setup page in the browser](screenshots/nextcloud-web.png)

**Figure 3.** Stack teardown output

![Docker Compose teardown output](screenshots/compose-teardown.png)

</div>
