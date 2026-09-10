<div align="center">

<img src="https://github.com/MikashitaDezu/INBENTORY/blob/48790ed03c13c072a0c6fb731c70b4194aea086e/1_WE-EQFubMHMnMv-bPIW5SA.png" width="400"/>

# Google Cloud Platform (GCP)

</div>

<p align="justify">
This document provides a research overview of Google Cloud Platform (GCP), one of the world's leading cloud platforms. It covers GCP's background, global infrastructure, management console, four core services, key advantages, and typical enterprise use cases.
</p>

---

## Brief Overview

<p align="justify">
Google Cloud Platform (GCP) grew out of the internal infrastructure Google built to run its own products such as Search and YouTube, and became publicly available as a commercial cloud platform between 2008 and 2011. GCP offers a wide catalog of services spanning compute, storage, databases, networking, and artificial intelligence, and is widely recognized as the strongest of the major providers in data analytics, machine learning, and container orchestration, largely because Google originally created and open sourced Kubernetes.
</p>

## Global Infrastructure

<p align="justify">
GCP organizes its physical infrastructure into <b>Regions</b> (isolated geographic areas), each containing multiple, independent <b>Zones</b> equipped with dedicated power, cooling, and networking to ensure fault tolerance. GCP also operates one of the largest private fiber networks of any cloud provider, connecting its data centers and edge points of presence directly rather than relying as heavily on the public internet for backbone traffic. This architecture enables businesses to deploy highly resilient applications with strong network performance worldwide.
</p>

## Cloud Management Console

<p align="justify">
The <b>Google Cloud Console</b> is a centralized web-based interface used to provision, monitor, and configure GCP resources. Upon signing in, users access the console dashboard to perform routine and administrative tasks:
</p>

- Search for and launch specific GCP services and projects
- Review billing reports and cost management dashboards
- Launch **Cloud Shell** for direct browser-based command-line execution with the `gcloud` CLI preinstalled
- Manage IAM roles, permissions, and resource labels

## Four (4) Core Services

1. **Compute Engine** – Provides resizable virtual server instances in the cloud, allowing organizations to scale compute capacity dynamically based on workload demands.

2. **Cloud Storage** – A highly scalable object storage service designed to store and protect any amount of unstructured data for websites, mobile applications, enterprise backups, and data lakes.

3. **Cloud SQL** – A managed relational database service that simplifies database administration tasks such as provisioning, patching, and backups for engines like MySQL, PostgreSQL, and SQL Server.

4. **Cloud IAM (Identity and Access Management)** – Manages secure access to GCP resources and services by enabling administrators to configure fine-grained permissions, roles, and policies at the project or organization level.

## Three (3) Advantages

1. **Leadership in AI and Machine Learning** – Tools like Vertex AI, BigQuery ML, and custom TPUs (Tensor Processing Units) give GCP an edge for data science and machine learning workloads.

2. **Kubernetes and Container Leadership** – Google Kubernetes Engine (GKE) benefits directly from being built by the same organization that created and open sourced Kubernetes.

3. **Competitive and Flexible Pricing** – Sustained use discounts and per-second billing let organizations save costs without needing to commit to upfront reserved instances.

## Typical Enterprise Use Cases

- Large-scale data analytics pipelines and business intelligence built on BigQuery
- AI and machine learning model training and deployment via Vertex AI or TPUs
- Containerized, microservice-based applications running on Google Kubernetes Engine (GKE)
- Global content delivery and ad-tech workloads that benefit from Google's private network
- Media, entertainment, and rendering pipelines requiring high-performance computing

---

## References

- Google. (n.d.). *Google Cloud Platform*. https://cloud.google.com/
- Google. (n.d.). *Google Cloud documentation*. https://cloud.google.com/docs
- Google. (n.d.). *Google Cloud locations*. https://cloud.google.com/about/locations
