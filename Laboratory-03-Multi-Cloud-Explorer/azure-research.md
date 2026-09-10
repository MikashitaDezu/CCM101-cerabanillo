<div align="center">

<img src="https://github.com/MikashitaDezu/INBENTORY/blob/48790ed03c13c072a0c6fb731c70b4194aea086e/Microsoft_Azure_Logo.svg.webp" width="400"/>

# Microsoft Azure

</div>

<p align="justify">
This document provides a research overview of Microsoft Azure, one of the world's leading cloud platforms. It covers Azure's background, global infrastructure, management console, four core services, key advantages, and typical enterprise use cases.
</p>

---

## Brief Overview

<p align="justify">
Microsoft Azure is Microsoft's public cloud computing platform, launched commercially in 2010. Azure has grown into one of the largest cloud providers by leaning heavily on its deep integration with the rest of the Microsoft ecosystem, including Windows Server, Active Directory, and Microsoft 365. It offers over 200 services spanning compute, storage, databases, networking, and artificial intelligence, and is widely adopted by enterprises that already run on Microsoft infrastructure, as well as government and regulated industries that rely on its compliance certifications.
</p>

## Global Infrastructure

<p align="justify">
Azure organizes its physical infrastructure into <b>Regions</b>, which are grouped into larger <b>Geographies</b> to support data residency and compliance requirements. Each Region typically contains multiple, independent <b>Availability Zones</b> equipped with dedicated power, cooling, and networking to ensure fault tolerance. Azure also maintains a global edge network through <b>Azure Front Door</b> and its CDN service to deliver content with low latency. This architecture allows businesses to deploy resilient applications while meeting regional data residency requirements.
</p>

## Cloud Management Console

<p align="justify">
The <b>Azure Portal</b> is a centralized web-based interface used to provision, monitor, and configure Azure resources. Upon signing in, users access the portal dashboard to perform routine and administrative tasks:
</p>

- Search for and launch specific Azure services and resource groups
- Review Azure Advisor recommendations and Cost Management billing dashboards
- Launch **Azure Cloud Shell** for direct browser-based command-line execution with Bash or PowerShell
- Manage role-based access control (RBAC) permissions and resource tags

## Four (4) Core Services

1. **Azure Virtual Machines** – Provides resizable virtual server instances in the cloud, allowing organizations to scale compute capacity dynamically based on workload demands.

2. **Azure Blob Storage** – A highly scalable object storage service designed to store and protect any amount of unstructured data for websites, mobile applications, enterprise backups, and data lakes.

3. **Azure SQL Database** – A managed relational database service that simplifies database administration tasks such as provisioning, patching, and backups, with built-in high availability.

4. **Microsoft Entra ID (Azure Active Directory)** – Manages secure access to Azure resources and services by enabling administrators to configure fine-grained permissions, user roles, and multi-factor authentication policies, while syncing directly with on-premises Active Directory.

## Three (3) Advantages

1. **Deep Microsoft Ecosystem Integration** – Connects seamlessly with Windows Server, Microsoft 365, and on-premises Active Directory, reducing rework for organizations already invested in Microsoft technologies.

2. **Strong Hybrid Cloud Capability** – Services like Azure Arc and Azure Stack allow organizations to manage on-premises and cloud resources under a single control plane.

3. **Enterprise Licensing and Compliance Maturity** – Many enterprises already hold Microsoft Enterprise Agreements, which can simplify Azure billing, and Azure carries a broad set of compliance certifications for regulated industries.

## Typical Enterprise Use Cases

- Hosting line-of-business applications integrated with Microsoft 365 and Active Directory
- Hybrid cloud deployments that connect on-premises data centers to the cloud
- Regulated industries such as government, healthcare, and finance relying on Azure's compliance certifications
- DevOps pipelines and application lifecycle management through Azure DevOps
- AI and machine learning development via Azure Machine Learning and the Azure OpenAI Service

---

## References

- Microsoft. (n.d.). *Microsoft Azure cloud computing services*. https://azure.microsoft.com/
- Microsoft. (n.d.). *Azure documentation*. https://learn.microsoft.com/en-us/azure/
- Microsoft. (n.d.). *Azure global infrastructure*. https://azure.microsoft.com/en-us/explore/global-infrastructure/
