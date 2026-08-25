# Project ED: Infrastructure Report — Server Diagnostics Overview

> **Target Environment:** KillerCoda Cloud-Hosted Linux Node  
> **Status:** Inspected & Verified ✅

## 📊 Server Hardware & Software Specifications

| Metric / Parameter | Details / Specification |
| :--- | :--- |
| **Operating System** | Ubuntu 24.04.4 LTS (Noble Numbat)[cite: 1] |
| **Kernel Version** | Linux 6.8.0-138-generic[cite: 1] |
| **CPU Model** | Intel Xeon E312xx (Sandy Bridge, IBRS update) @ 2.0GHz[cite: 1] |
| **CPU Cores** | 1 Virtual Core (1 Thread per core, 1 Socket)[cite: 1] |
| **Total RAM** | 1.9Gi System Memory (with 1.0Gi Swap space)[cite: 1] |
| **Disk Capacity** | 19G Total Block Storage on root volume (`/dev/vda1`)[cite: 1] |
| **Mounted File Systems** | Root (`/` via `/dev/vda1`), Runtime (`/run` via `tmpfs`), Shared Memory (`/dev/shm`), Control Groups (`/sys/fs/cgroup`), Boot (`/boot` via `/dev/vda16`), EFI (`/boot/efi` via `/dev/vda15`)[cite: 1] |
| **Hostname** | `ubuntu`[cite: 1] |
| **IP Address** | External/Primary: `172.30.1.2/24` (`enp1s0`) <br> Internal Bridge: `172.17.0.1/16` (`docker0`)[cite: 1] |

---

## 🔍 Investigation & Diagnostic Summary

The target KillerCoda cloud server instance was successfully inspected using core Linux command-line diagnostic tools (`lscpu`, `uname -r`, `free -h`, `df -h`, `hostname`, and `ip a`). 

### Key Architectural Takeaways:
* **Virtualization Layer:** The system operates on a full KVM virtualization framework, providing clean separation and foundational performance metrics[cite: 1].
* **Resource Readiness:** With a stable 2.0GHz virtual CPU, 1.9 GiB of memory, and 19 GiB of dedicated block storage, the instance fulfills all baseline pre-deployment requirements for the event-driven cloud infrastructure flow.
* **Network Interfacing:** Configured with an active external route (`enp1s0`) and a local containerized bridge (`docker0`), the environment is well-suited to handle isolated multi-tier communications and containerized workloads.
