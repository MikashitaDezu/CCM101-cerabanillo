# Project ED: Event-Driven Scalable Cloud Infrastructure Flow

## Mission Overview
CloudNova Technologies assigned this mission to investigate the foundational infrastructure that powers modern cloud computing before deploying any services. The task involved inspecting a live cloud-hosted Linux server environment, analyzing core infrastructure components, and preparing technical documentation to support senior engineers in designing an event-driven cloud architecture.

## Objectives
* Explain the major components of cloud infrastructure.
* Investigate the hardware and software resources available in a Linux environment.
* Differentiate compute, storage, networking, and identity resources.
* Interpret the relationship between cloud infrastructure components.
* Create professional technical documentation using Markdown.
* Continue building a structured GitHub Cloud Computing Portfolio.

## Cloud Infrastructure Components
* **Compute Resources:** Virtual processing units and memory (Intel Xeon virtual CPU and RAM) responsible for executing instructions and managing event-driven workloads.
* **Storage Resources:** Persistent block storage volumes (`/dev/vda1`) and runtime memory filesystems (`tmpfs`) used to store operating systems, files, and transaction logs.
* **Networking Resources:** Interface controls (`enp1s0`, `lo`, and `docker0`) that handle IP routing, local communication, and scalable container messaging networks.
* **Operating System:** Ubuntu 24.04.4 LTS running kernel version 6.8.0-138-generic, providing the core runtime layer for system applications.

## Tools Used
* **KillerCoda Playground:** A browser-based interactive Linux environment used for server diagnostics.
* **Git & GitHub:** Version control system and remote repository platform utilized for maintaining the cloud computing portfolio.
* **Markdown:** Lightweight markup language used for creating clean, professional technical documentation.
* **Diagramming Tool (Draw.io / Excalidraw):** Used to design and export the scalable cloud architecture diagram.

## Linux Commands Executed
* `cat /etc/os-release` – To determine the operating system distribution and version.
* `uname -r` – To inspect the active Linux kernel version.
* `lscpu` – To analyze the CPU model, core architecture, and virtualization flags.
* `free -h` – To evaluate total and available system memory (RAM and swap).
* `df -h` – To inspect disk capacity and mounted file system volumes.
* `hostname` – To check the assigned network hostname.
* `ip a` – To review network interfaces, IP configurations, and bridge setups.

## Skills Learned
* Gained practical experience inspecting and diagnosing cloud-based Linux server instances via command-line diagnostics.
* Developed the ability to map physical/virtual Linux server metrics to core cloud infrastructure concepts (compute, storage, networking).
* Enhanced technical writing and formatting skills using Markdown for engineering reports.
* Practiced structuring professional documentation and tracking artifacts within a GitHub repository portfolio.

## Challenges Encountered
* Accurately translating low-level terminal diagnostics into structured, client-ready cloud terminology.
* Structuring the repository file tree precisely to match institutional naming conventions and requirements.
