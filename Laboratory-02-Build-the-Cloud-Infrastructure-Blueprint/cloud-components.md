# Cloud Infrastructure Components Analysis

## 1. Compute Resources
* **Purpose:** Compute resources provide the processing power, CPU cycles, and memory (RAM) required to execute applications, run operating systems, and process data workloads.
* **Importance in Cloud Computing:** In cloud architecture, compute forms the backbone of virtual servers (such as AWS EC2 or Azure VMs), enabling organizations to dynamically scale processing capabilities up or down based on demand without managing physical hardware.
* **Relation to KillerCoda:** The Linux environment provided by KillerCoda acts as our primary compute instance, utilizing allocated virtual CPU cores and RAM to run terminal commands and process user requests in real time.

## 2. Storage Resources
* **Purpose:** Storage resources are used to persist, retain, and organize data, files, application binaries, and system logs over time.
* **Importance in Cloud Computing:** Reliable storage ensures data durability, security, and fast retrieval across distributed networks. It allows cloud environments to handle persistent volumes, block storage, and object repositories seamlessly.
* **Relation to KillerCoda:** The local disk capacity and mounted file systems (`df -h`) on the KillerCoda server represent our local block storage, where directories like our markdown portfolio files and system reports are securely saved.

## 3. Networking Resources
* **Purpose:** Networking resources establish communication pathways between compute instances, storage, external networks, and users via IP addresses, ports, routers, and virtual local area networks (VLANs).
* **Importance in Cloud Computing:** Networking connects isolated cloud components into a cohesive system, ensuring secure, low-latency data transmission and external accessibility via the internet.
* **Relation to KillerCoda:** The container's assigned IP address, hostname, and active network interfaces allow us to establish remote secure shell (SSH) connections and communicate across the internet to sync our work to GitHub.

## 4. Operating System (OS)
* **Purpose:** The operating system acts as the core interface layer between computer hardware and user software, managing hardware components, system processes, security, and file hierarchies.
* **Importance in Cloud Computing:** The OS provides a standardized execution layer for containerized or virtualized cloud workloads, ensuring stability, resource isolation, and compatibility across diverse hardware footprints.
* **Relation to KillerCoda:** The KillerCoda environment runs on an Ubuntu Linux distribution, providing a stable command-line environment and core kernel utilities required to perform our cloud infrastructure diagnostic tasks.
