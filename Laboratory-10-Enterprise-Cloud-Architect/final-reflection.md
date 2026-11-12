# Final Reflection

**CCM101 Cloud Computing | University of Eastern Pangasinan | Mission 10: Enterprise Cloud Architect**

---

## 1. Introduction

Completing Missions 1 through 10 of CCM101 changed how I understand cloud computing. I began the course thinking of the cloud as a place to store files and host websites. I now see it as a set of connected layers, including servers, networks, storage, security, and automation, that someone has to design, build, and keep running.

This reflection looks back at what each stage of the course taught me, how Mission 10 brought those lessons together, and what I still need to improve.

---

## 2. Learning Experience from Missions 1 to 9

The first nine missions built my skills one layer at a time.

**Foundations (Missions 1 to 3).** I learned the Linux commands needed to check an operating system, CPU, memory, and disk space, and I set up the GitHub portfolio that holds all of my work. I planned a cloud infrastructure blueprint and compared AWS, Azure, and Google Cloud Platform. The planning work taught me that choosing the right resources before building saves time and cost later.

**Containers and storage (Missions 4 and 5).** I learned how Docker packages an application so it runs the same way everywhere, and I practiced the container lifecycle from running to stopping and removing. In the object storage lab, the original MinIO image was no longer available. I had to read the error, find a working image, and get it running. That taught me to verify that a tool still exists and to read output before assuming a command worked.

**Deployment and operations (Missions 6 and 7).** Docker Compose showed me how to describe a multi-tier application as code. I deployed Nextcloud with a MariaDB database, and the database image I first planned to use also needed replacing. In the operations lab, I collected evidence from memory, disk, and CPU readings, Docker logs, and container metrics instead of assuming the server was healthy.

**Security and automation (Missions 8 and 9).** I enabled a firewall, audited open ports, and learned to allow only the traffic a service needs. I then wrote a Bash backup script, made it executable with `chmod +x`, and scheduled it with Cron. My Mission 9 reflection noted that automation repeats mistakes as reliably as it repeats good work, and that lesson shaped how I approached the final mission.

---

## 3. Mission 10: Enterprise Cloud Architect

Mission 10 removed the step-by-step guides. I had to combine everything above into one working system, which I named CloudNova.

**Architecture.** CloudNova runs on an Ubuntu Server virtual machine inside Oracle VirtualBox. The VM uses two network adapters. A NAT adapter provides internet access, and a Host-only adapter lets my Windows laptop reach the server and its website.

**Deployment.** I installed Docker Engine and Docker Compose, then wrote a `docker-compose.yml` that runs WordPress and MariaDB as linked containers on a shared Docker network. Database credentials are kept in a protected `.env` file that is not committed to GitHub. Named Docker volumes keep both the website files and the database after a restart or reboot. This is the requirement I consider most important, because a database that loses its data when a container restarts is not usable in production.

**Security.** I enabled UFW with a default deny policy for incoming traffic and allowed only the access the system needs. SSH is restricted to the Host-only network, root login is disabled, password authentication is turned off, and access requires an ED25519 key. I also learned that Docker-published ports can bypass UFW, so the WordPress port needs its own firewall rules. This was a lesson that a single tool does not always control all traffic.

**Automation.** I wrote a Bash script that exports the MariaDB database, compresses it with Gzip, adds a timestamp to the filename, tests the archive, and deletes backups older than seven days. A Cron job runs it every day at 2:00 AM UTC, which is 10:00 AM Philippine Time. The script is built to fail safely. It stops on errors and removes incomplete backup files instead of leaving a corrupted one that looks valid.

**Documentation.** I wrote an operational manual so that another IT team could deploy, secure, and maintain the system without me. Writing it showed me which steps I understood well and which I had only copied.

---

## 4. Challenges and Lessons Learned

The hardest parts of the project were the network, SSH access, and firewall rules. These settings affect each other. A change to the firewall or SSH configuration can lock me out of the server, and a mistake in the network setup stops the laptop from reaching the website at all. I learned to keep a second SSH session open while testing security changes, to validate configuration files before reloading a service, and to test each layer separately before moving to the next.

The backup script taught me that a backup is only useful if it can be restored. Creating the file is half the job. Verifying the archive and practicing a restore is the other half.

Across all ten missions, the most important lesson was to understand a command before running it, especially one that changes security settings or touches stored data. A command such as `docker compose down -v` looks similar to a safe one but permanently deletes data.

---

## 5. Areas for Improvement

If I continued this project, I would:

- Pin the WordPress image to a specific version instead of using `latest`, so updates do not change the system unexpectedly.
- Copy backups to a second location, because a backup stored on the same server is lost if that server fails.
- Add monitoring and alerts so that a failed backup or stopped container is noticed without manual checking.
- Add HTTPS with a valid certificate so traffic to the website is encrypted.

---

## 6. Conclusion

CCM101 took me from basic Linux commands to designing, securing, and automating a complete multi-tier application. CloudNova represents that growth. It combines virtualization, containers, networking, persistent storage, firewall security, and scheduled backups in one system that another person can read about and rebuild.

I still have a lot to learn, especially in monitoring, encryption, and working with large-scale cloud platforms. This course gave me a practical foundation, and the habits of testing carefully, documenting clearly, and understanding what I run are ones I will carry into future IT work.
