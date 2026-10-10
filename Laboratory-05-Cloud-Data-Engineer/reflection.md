<div align="center">

# Mission Reflection

**Laboratory 5: The Cloud Data Engineer**
CCM101 Cloud Computing | University of Eastern Pangasinan

</div>

---

## 1. Object Storage for Millions of Photos

Block storage splits data into fixed-size blocks and needs a file system layered on top to manage them. That becomes a bottleneck with millions of individual files. Object storage treats each photo as a standalone object with its own metadata and identifier, kept in a flat address space instead of a folder hierarchy. Adding the millionth photo takes no more effort than adding the first.

---

## 2. Deploying MinIO with Docker

Docker turned what could have been a lengthy manual install into a single command. The server came packaged and ready to run, with credentials and ports set through simple flags, so I did not have to configure a service or manage dependencies on the host. When the original image turned out to be unavailable, I could swap in a different one without changing anything else.

---

## 3. What a Bucket Is

A bucket is the top-level container that organizes objects in cloud storage. It works like a root folder, but without the nested directories of a traditional file system. Every object belongs to a bucket, and access permissions and storage policies are usually applied at the bucket level.

---

## 4. Protecting Data from Server Failure

Large companies mainly rely on replication. They keep multiple copies of each object across different drives, servers, or data centers. If one server fails, the data still exists elsewhere and can be served without interruption. Regular backups and built-in redundancy add further protection, which is how services like Amazon S3 promise very high durability.

---

## 5. Confidence with the Linux Command Line

Typing Docker commands and troubleshooting failed image pulls stopped feeling unfamiliar during this mission. Having to find and test a working alternative also pushed me to read error messages more carefully instead of retyping the same command. That habit matters as much as knowing the commands themselves.
