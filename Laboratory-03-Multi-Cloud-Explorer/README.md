# Laboratory 03 — Multi-Cloud Explorer

**Course:** CCM101 – Cloud Computing
**Mission:** Become a Multi-Cloud Explorer
**Role:** Cloud Evaluation Team, CloudNova Technologies

## Overview

This lab evaluates AWS, Microsoft Azure, and Google Cloud Platform (GCP) across their
core services, compares their strengths, and recommends the best-fit platform for
different client scenarios. It also connects a Linux server investigation to real
cloud hosting options.

See the other files in this folder for the full breakdown:

- `aws-research.md` — AWS overview and core services
- `azure-research.md` — Azure overview and core services
- `gcp-research.md` — GCP overview and core services
- `cloud-platform-comparison.md` — Comparison table + service-matching table
- `client-recommendations.md` — Recommendations for Clients A–D + decision matrix
- `reflection.md` — Mission reflection
- `screenshots/` — Supporting screenshots for each checkpoint

---

## Checkpoint 7 — Continue Your Linux Investigation

A KillerCoda Ubuntu Playground was launched and the following commands were run to
inspect the server's specs.

### Operating System

Command: `uname -a`

```
Linux ubuntu 6.8.0-138-generic #138-Ubuntu SMP PREEMPT_DYNAMIC Fri Jul 31 22:41:49 UTC 2026 x86_64 x86_64 x86_64 GNU/Linux
```

Ubuntu 24.04, kernel `6.8.0-138-generic`, 64-bit x86_64 architecture.

### CPU Information

Command: `lscpu`

- Architecture: x86_64
- CPU(s): 1 (1 socket × 1 core per socket × 1 thread per core)
- Model: Intel Xeon E312xx (Sandy Bridge, IBRS update)
- Speed: 2.0 GHz
- Virtualization: Full, under KVM

### Memory

Command: `free -h`

```
              total        used        free      shared  buff/cache   available
Mem:          1.9Gi       416Mi       861Mi       1.1Mi       793Mi       1.5Gi
Swap:         1.0Gi          0B       1.0Gi
```

Total memory: **1.9 GB RAM**, 1.0 GB swap.

### Disk Space

Command: `df -h`

```
Filesystem      Size  Used Avail Use% Mounted on
/dev/vda1        19G  5.4G   13G  30% /
```

Root filesystem (`/`): 19 GB total, 5.4 GB used, 13 GB available (30% usage).

### Migration Question

**If this Linux server were migrated to the cloud, which AWS, Azure, and GCP services could host it?**

This server is a small workload — 1 vCPU, ~2 GB RAM, ~20 GB disk, with low actual
utilization (only 416 Mi of 1.9 Gi RAM in use and 30% disk usage). That profile maps
to burstable, shared-core VM tiers rather than dedicated high-performance instances:

- **AWS:** A `t3.micro` or `t3.small` EC2 instance fits well. `t3.micro` (2 vCPU burst,
  1 GB RAM) is closest to the observed footprint and is included in AWS's free tier,
  making it a natural fit for a low-traffic Ubuntu box like this one.
- **Azure:** A `B1s` Burstable VM (1 vCPU, 1 GB RAM) matches the light usage seen here,
  with `B2s` (2 vCPU, 4 GB) as a step up if the workload grows.
- **GCP:** An `e2-micro` (2 vCPU, 1 GB RAM) or `e2-small` (2 vCPU, 2 GB RAM) Compute
  Engine instance is the equivalent; `e2-small` most closely matches the ~2 GB RAM
  actually available.

All three recommended families are burstable/shared-core tiers because the measured
CPU and memory usage is low — there's no sustained heavy load here that would justify
paying for a larger, dedicated-core instance.

**Screenshot:** `screenshots/killercoda-terminal.png`
