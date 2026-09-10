<div align="center">

# Client Recommendations

</div>

## Client A – Startup Company

<p align="justify">
<b>Scenario:</b> A startup company wants to launch a new mobile application. Their budget is limited, but they expect rapid growth within the next few years.
</p>

**Recommended Platform:** Amazon Web Services (AWS)

<p align="justify">
Budget and growth are the two constraints that matter most here, and AWS handles both. The AWS Free Tier and pay-as-you-go pricing keep costs low while the startup is finding its footing, and because AWS already covers such a wide range of services, the company won't need to migrate to a different provider once it starts scaling. There's also a practical upside for a small team without a dedicated IT department: AWS has the biggest community of the three platforms, so documentation, tutorials, and third-party integrations are easier to come by when something breaks at 2am. As the app grows, more advanced services can be layered on without tearing down what's already built.
</p>

**Services to use:**
- **Amazon EC2** – to host the mobile app's backend
- **Amazon S3** – to store user uploads, images, and backups
- **Amazon RDS** – to manage the app's database as it scales

---

## 🎓 Client B – University

<p align="justify">
<b>Scenario:</b> A university already uses Windows Server, Microsoft 365, and Active Directory. The university wants to migrate some services to the cloud.
</p>

**Recommended Platform:** Microsoft Azure

<p align="justify">
The university's existing stack basically decides this one. Since it already runs Windows Server, Microsoft 365, and Active Directory, Azure integrates without asking the school to change how it manages accounts, since Entra ID connects directly to the Active Directory already in place. Staff and students keep the same login experience across on-site and cloud systems, and IT doesn't have to retrain on a tool it's never touched. Azure Arc also means the migration doesn't have to happen all at once. Services can move to the cloud in stages instead of a single risky cutover.
</p>

**Services to use:**
- **Microsoft Entra ID** – to manage logins and connect with the existing Active Directory
- **Azure Virtual Machines** – to host migrated applications
- **Azure SQL Database** – to move on-premises databases to the cloud

---

## 🤖 Client C – AI Research Company

<p align="justify">
<b>Scenario:</b> A research company develops Artificial Intelligence and Machine Learning applications that require high-performance computing.
</p>

**Recommended Platform:** Google Cloud Platform (GCP)

<p align="justify">
High-performance computing for AI training is where GCP separates itself from the other two. Google built Kubernetes and still leads its development, so GCP's environment for running large-scale, container-based AI workloads is the most mature of the three platforms. Vertex AI and TensorFlow, both built in-house at Google, cover the full pipeline from building to training to deploying models, which cuts down on stitching together tools from different vendors. GCP's private global network also matters more here than it might elsewhere, since AI workloads live and die by how fast huge datasets can move between storage and compute.
</p>

**Services to use:**
- **Vertex AI** – to build and train machine learning models
- **Compute Engine** – for high-performance computing power
- **Google Kubernetes Engine (GKE)** – to run and scale AI workloads efficiently

---

## 🛒 Client D – Global E-Commerce Company

<p align="justify">
<b>Scenario:</b> A multinational online shopping company serves customers around the world and requires highly available infrastructure with automatic scaling.
</p>

**Recommended Platform:** Amazon Web Services (AWS)

<p align="justify">
Global availability with automatic scaling narrows this down fast, and AWS's footprint of Regions and Availability Zones is built for exactly that, keeping the site fast and available no matter where a customer is browsing from. Its auto-scaling tools are built to absorb sudden traffic spikes, like the kind that hits during a flash sale, without manual intervention. Amazon's own retail platform runs on this same infrastructure, which is about as strong a proof point as scale claims get. AWS's broad service catalog also leaves room to bolt on features like personalized recommendations or fraud detection later, without needing a new provider.
</p>

**Services to use:**
- **Amazon EC2 with Auto Scaling** – to automatically handle changes in traffic
- **Amazon CloudFront** – to deliver content quickly to customers worldwide
- **Amazon RDS** – to manage product and order data reliably

---

<div align="center">

<sub>- CHECKPOINT 6 -</sub>

# Multi-Cloud Decision Matrix

</div>

<p align="justify">
This section presents a simple decision matrix that recommends the most suitable cloud platform for different business needs. It summarizes the reasoning behind each recommendation, based on the strengths of AWS, Microsoft Azure, and Google Cloud Platform explored throughout this research.
</p>

<div align="center">

| Business Requirement | Recommended Platform | Justification |
|---|---|---|
| Startup Company | AWS | Free tier and pay-as-you-go pricing keep early costs down, and the wide service catalog means no need to switch providers once growth kicks in. |
| Enterprise Organization | AWS | Longest track record of the three and the broadest service catalog, which suits large-scale operations with varied and changing needs. |
| Microsoft Environment | Azure | Connects directly to Windows Server, Active Directory, and Microsoft 365, so companies already on Microsoft tools don't have to rebuild their setup. |
| AI / Machine Learning | GCP | Vertex AI and TensorFlow cover the full ML pipeline, backed by strong high-performance computing for training and deploying models. |
| Kubernetes Deployment | GCP | Built Kubernetes and still leads its development, which is why GKE is generally considered the most mature managed Kubernetes service. |
| Global Web Application | AWS | Large network of Regions and Availability Zones worldwide, paired with auto-scaling tools proven at retail scale. |

</div>
