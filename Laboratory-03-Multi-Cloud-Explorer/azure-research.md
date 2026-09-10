<div align="center">

<img src="https://github.com/MikashitaDezu/INBENTORY/blob/48790ed03c13c072a0c6fb731c70b4194aea086e/Microsoft_Azure_Logo.svg.webp" width="400"/>

# Microsoft Azure

</div>

## Brief Overview

<p align="justify">
Microsoft Azure is Microsoft's public cloud platform, launched commercially in 2010. What sets it apart is how closely it ties into the rest of Microsoft's products, including Windows Server, Active Directory, and Microsoft 365. Azure offers more than 200 services spanning compute, storage, databases, networking, and artificial intelligence, and its biggest customer base is organizations already running on Microsoft infrastructure, along with government and other regulated industries that need its compliance certifications.
</p>

## Global Infrastructure

<p align="justify">
Azure splits its physical infrastructure into <b>Regions</b>, which are grouped into larger <b>Geographies</b> to help with data residency and compliance requirements. Each Region typically has several independent <b>Availability Zones</b>, each with its own power, cooling, and networking, so a failure in one zone does not bring down the others. Azure also runs a global edge network through <b>Azure Front Door</b> and its CDN to keep content delivery fast. This lets businesses build resilient applications while still meeting regional data residency rules.
</p>

## Cloud Management Console

<p align="justify">
The <b>Azure Portal</b> is the web interface for provisioning, monitoring, and configuring Azure resources. After signing in, the portal dashboard lets you:
</p>

- Search for and launch Azure services and resource groups
- Check Azure Advisor recommendations and Cost Management billing dashboards
- Launch **Azure Cloud Shell** for command-line access directly in the browser, with Bash or PowerShell
- Manage role-based access control (RBAC) permissions and resource tags

## Four (4) Core Services

1. **Azure Virtual Machines** – Resizable virtual server instances, so compute capacity can scale up or down with demand instead of being fixed in advance.

2. **Azure Blob Storage** – Object storage for unstructured data, used for websites, mobile apps, backups, and data lakes.

3. **Azure SQL Database** – A managed relational database service that handles provisioning, patching, and backups, with high availability built in.

4. **Microsoft Entra ID (Azure Active Directory)** – Controls who can access Azure resources, letting administrators set fine-grained permissions, user roles, and multi-factor authentication, while syncing directly with an organization's on-premises Active Directory.

## Three (3) Advantages

1. **Microsoft Ecosystem Integration** – Connects directly with Windows Server, Microsoft 365, and on-premises Active Directory, so organizations already using these tools don't have to rebuild their identity and access setup from scratch.

2. **Hybrid Cloud Capability** – Services like Azure Arc and Azure Stack let organizations manage on-premises and cloud resources from one control plane.

3. **Enterprise Licensing and Compliance** – Many enterprises already hold Microsoft Enterprise Agreements, which can simplify Azure billing, and Azure carries a broad set of compliance certifications for regulated industries.

## Typical Enterprise Use Cases

- Hosting line-of-business applications tied into Microsoft 365 and Active Directory
- Hybrid cloud deployments connecting on-premises data centers to the cloud
- Government, healthcare, and finance workloads that rely on Azure's compliance certifications
- DevOps pipelines and application lifecycle management through Azure DevOps
- AI and machine learning development through Azure Machine Learning and the Azure OpenAI Service

---

## References

- Microsoft. (n.d.). *Microsoft Azure cloud computing services*. https://azure.microsoft.com/
- Microsoft. (n.d.). *Azure documentation*. https://learn.microsoft.com/en-us/azure/
- Microsoft. (n.d.). *Azure global infrastructure*. https://azure.microsoft.com/en-us/explore/global-infrastructure/
