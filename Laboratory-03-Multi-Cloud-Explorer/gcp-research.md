<div align="center">

<img src="https://github.com/MikashitaDezu/INBENTORY/blob/48790ed03c13c072a0c6fb731c70b4194aea086e/1_WE-EQFubMHMnMv-bPIW5SA.png" width="200"/>

# Google Cloud Platform (GCP)

![Launched](https://img.shields.io/badge/Launched-2008--2011-orange) ![Services](https://img.shields.io/badge/Services-100%2B-blue) ![Category](https://img.shields.io/badge/Category-IaaS%20%7C%20PaaS-lightgrey)

</div>

---

## Brief Overview

<p align="justify">
Google Cloud Platform (GCP) grew out of the infrastructure Google built to run its own products, like Search and YouTube, and became available as a commercial cloud platform between 2008 and 2011. It offers services spanning compute, storage, databases, networking, and artificial intelligence. GCP's strongest area is arguably data analytics, machine learning, and container orchestration, which makes sense given that Google is the company that built and open sourced Kubernetes in the first place.
</p>

---

## Global Infrastructure

<p align="justify">
GCP splits its physical infrastructure into <b>Regions</b>, isolated geographic areas, each containing several independent <b>Zones</b> with their own power, cooling, and networking, so a failure in one zone does not bring down the others. GCP also runs one of the largest private fiber networks of any cloud provider, connecting its data centers and edge points directly instead of relying as heavily on the public internet for backbone traffic. That network is part of why GCP tends to perform well for latency-sensitive workloads.
</p>

---

## Cloud Management Console

<p align="justify">
The <b>Google Cloud Console</b> is the web interface for provisioning, monitoring, and configuring GCP resources. After signing in, the console dashboard lets you:
</p>

- Search for and launch GCP services and projects
- Check billing reports and cost management dashboards
- Launch **Cloud Shell** for command-line access directly in the browser, with the `gcloud` CLI already installed
- Manage IAM roles, permissions, and resource labels

---

## Four (4) Core Services

| # | Service | What it does |
|---|---|---|
| 1 | **Compute Engine** | Resizable virtual server instances, so compute capacity can scale up or down with demand instead of being fixed in advance. |
| 2 | **Cloud Storage** | Object storage for unstructured data, used for websites, mobile apps, backups, and data lakes. |
| 3 | **Cloud SQL** | A managed relational database service that handles provisioning, patching, and backups for engines like MySQL, PostgreSQL, and SQL Server. |
| 4 | **Cloud IAM** (Identity and Access Management) | Controls who can access GCP resources, letting administrators set fine-grained permissions and roles at either the project or organization level. |

---

## Three (3) Advantages

1. **AI and Machine Learning** – Tools like Vertex AI, BigQuery ML, and custom TPUs (Tensor Processing Units) give GCP an edge for data science and machine learning workloads.

2. **Kubernetes and Containers** – Google Kubernetes Engine (GKE) has a natural advantage, since Kubernetes itself came out of Google.

3. **Flexible Pricing** – Sustained use discounts and per-second billing let organizations save money without committing to reserved instances up front.

---

## Typical Enterprise Use Cases

- Large-scale data analytics and business intelligence built on BigQuery
- AI and machine learning model training and deployment through Vertex AI or TPUs
- Containerized, microservice-based applications running on Google Kubernetes Engine (GKE)
- Global content delivery and ad-tech workloads that benefit from Google's private network
- Media, entertainment, and rendering pipelines that need high-performance computing

---

## References

- Google. (n.d.). *Google Cloud Platform*. https://cloud.google.com/
- Google. (n.d.). *Google Cloud documentation*. https://cloud.google.com/docs
- Google. (n.d.). *Google Cloud locations*. https://cloud.google.com/about/locations
