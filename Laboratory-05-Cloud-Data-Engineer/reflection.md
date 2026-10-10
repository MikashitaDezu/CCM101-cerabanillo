<div align="center">

# Mission Reflection

**Laboratory 5: The Cloud Data Engineer**
CCM101 Cloud Computing | University of Eastern Pangasinan

</div>

---

## Reflection Overview

| Field | Details |
| :--- | :--- |
| **Topic** | Object storage, MinIO, and Docker deployment |
| **Environment** | KillerCoda Ubuntu 24.04 Playground |
| **Questions Answered** | 5 |
| **Format** | First-person reflection, 250 to 350 words |

---

## 1. Object Storage for Millions of Photos

> **Why is object storage better suited for storing millions of photos compared to a traditional block storage hard drive?**

A traditional block storage drive organizes data into fixed-size blocks and usually needs a file system layered on top to manage everything. That becomes a bottleneck once you are storing millions of individual files. Object storage skips that layer by treating each photo as a standalone object with its own metadata and identifier, kept in a flat address space instead of a folder hierarchy. It scales more naturally, since adding the millionth photo does not mean managing directory depth or file system limits.

---

## 2. Deploying MinIO with Docker

> **How did using Docker make it easier to deploy the MinIO storage server?**

Docker turned what could have been a lengthy manual install into a single command. Instead of installing MinIO's binaries, configuring a service, and managing dependencies on the host, the server came packaged and ready to run, with credentials and ports set through simple flags. When the original image turned out to be unavailable, Docker also let me swap in a different image without changing anything else in the deployment.

---

## 3. What a Bucket Is

> **What is a "bucket" in the context of cloud storage?**

A bucket is the top-level container that organizes objects in cloud storage. It works like a root folder, but without the nested directory structure of a traditional file system. Every uploaded object has to belong to a bucket, and access permissions, naming rules, and storage policies are usually applied at the bucket level.

---

## 4. Protecting Data from Server Failure

> **How do large enterprise companies ensure their object storage data is not lost if the physical server crashes?**

Large companies protect object storage data mainly through replication. They keep multiple copies of each object across different drives, servers, or separate data centers. If one server fails, the data still exists elsewhere and can be served without interruption. Together with regular backups and redundancy built into the storage architecture, this is how services like Amazon S3 can promise very high durability.

---

## 5. Confidence with the Linux Command Line

> **How is your confidence in navigating the Linux command line growing?**

Between this mission and the last one, typing Docker commands and troubleshooting failed image pulls stopped feeling unfamiliar. Running into an unavailable image and having to find and test a working alternative also pushed me to read error messages more carefully instead of retyping the same command. That habit matters as much as knowing the commands themselves.
