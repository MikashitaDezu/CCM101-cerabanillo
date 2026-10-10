# Mission 5: The Cloud Data Engineer

## Mission Overview

After deploying containerized web servers in the previous mission, I was reassigned to the Cloud Data Engineering Team at CloudNova Technologies. This mission focused on deploying an S3-compatible object storage server using MinIO, creating a storage bucket, and uploading data to it. The result is a proof-of-concept environment for a client's photo-sharing application.

## Objectives

- Differentiate between Block, File, and Object Storage.
- Deploy an S3-compatible Object Storage server (MinIO) using Docker.
- Access a cloud service through a web interface using port forwarding.
- Create a storage bucket and upload objects (files) to the cloud.
- Document cloud storage operations using Markdown.
- Continue expanding a professional GitHub Cloud Computing Portfolio.

## Tools Used

- Docker
- MinIO, deployed from the community-maintained image `ghcr.io/imagegenius/minio:latest` because the official `minio/minio` image is no longer available on Docker Hub
- KillerCoda Ubuntu Playground
- MinIO Web Console

## Skills Learned

- Differentiating between Block, File, and Object Storage and identifying when each is used.
- Deploying a containerized service with environment variables for configuration.
- Accessing a cloud service through port forwarding on a specific port.
- Creating and managing an S3-compatible storage bucket.
- Uploading files through a web-based object storage console.
- Adapting a deployment when an expected image is unavailable, a common situation when vendors change how they distribute software.
