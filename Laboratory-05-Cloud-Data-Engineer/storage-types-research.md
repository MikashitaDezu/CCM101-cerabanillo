<div align="center">

# Types of Cloud Storage

**Laboratory 5: The Cloud Data Engineer**
CCM101 Cloud Computing | University of Eastern Pangasinan

</div>

---

## Research Summary

| Field | Details |
| :--- | :--- |
| **Topic** | Block, File, and Object Storage in the cloud |
| **Client Scenario** | Photo-sharing application storing millions of user-uploaded images |
| **Recommendation** | Object Storage |

Cloud applications use different storage models depending on the kind of data they hold and how it is accessed. The three primary types are Block Storage, File Storage, and Object Storage. Each is suited to a different set of workloads.

---

## 1. Storage Type Comparison

| Storage Type | Description | Primary Use Case | Cloud Provider Example |
| :--- | :--- | :--- | :--- |
| **Block Storage** | Splits data into fixed-size blocks, each with its own address, and presents them to a system like a raw hard drive. An operating system or application must manage the file system on top. | Databases, virtual machine disks, and applications that need fast, low-latency read and write access. | AWS EBS |
| **File Storage** | Organizes data in a hierarchy of files and folders and serves it through a shared network file system. | Shared drives, content management systems, and workloads where multiple servers or users read and write the same files. | AWS EFS |
| **Object Storage** | Stores data as discrete objects, each holding the data, its metadata, and a unique identifier, in a flat address space with no folders. | Large volumes of unstructured data such as images, videos, backups, and static web assets. | AWS S3 |

---

## 2. Technical Characteristics

| Characteristic | Block Storage | File Storage | Object Storage |
| :--- | :--- | :--- | :--- |
| **Data Organization** | Fixed-size blocks | Files in folders | Objects in a flat namespace |
| **Typical Access Method** | Attached to a server as a disk | Network file protocols such as NFS | HTTP-based API |
| **Metadata** | Minimal | Basic file attributes | Rich, customizable per object |
| **Scalability** | Limited by volume size | Scales with the file system | Virtually unlimited |

> [!NOTE]
> Cloud providers continue to extend these services, so features such as shared access to block volumes vary by provider. The table describes the typical model for each type.

---

## 3. Recommendation for the Client

Object Storage is the best fit for your photo-sharing application. It scales to millions of images without any disk or folder management, and each image is stored as an independent object that can be served directly over HTTP. Because containers are ephemeral, keeping images in a dedicated storage service means they remain available when your web server container is restarted or replaced.
