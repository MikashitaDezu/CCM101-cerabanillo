<div align="center">

# Security Audit Report

**Laboratory 8: Cloud Security Engineer**
CCM101 Cloud Computing | University of Eastern Pangasinan

</div>

---

## Audit Summary

| Field | Details |
| :--- | :--- |
| **Purpose** | Define the core security concepts behind the hardening of the CloudNova web server, and record a baseline port audit before any changes |
| **Target** | Ubuntu server running an Nginx container named `secure-web-app` on port 8080 |
| **Audit Tool** | `ss -tulpn` |
| **Concepts Covered** | Principle of Least Privilege, Attack Surface, Default Deny Policy |
| **Environment** | KillerCoda Ubuntu Playground |

This report was written before any firewall rules were applied. Each concept is defined in my own words, and the final table shows how each one applies to the server in this mission.

---

## 1. The Principle of Least Privilege (PoLP)

The Principle of Least Privilege means giving every user, application, and service only the access it needs to do its job, and nothing more. In the cloud this matters because accounts are the main way into a system, so a stolen or misused account with broad rights can do far more damage than one with narrow rights. Limiting access keeps a single mistake or breach from spreading across the whole environment.

---

## 2. Attack Surface

The attack surface of a virtual machine is the total set of points where an attacker could try to get in. This includes open network ports, running services, installed software, and user accounts. The more of these that are exposed, the more chances an attacker has to find a weakness, so a smaller attack surface means a safer machine.

---

## 3. Default Deny Policy

A default deny policy blocks all incoming traffic unless a rule specifically allows it. This is safer than blocking attackers one by one, because it is impossible to know every hostile address in advance and new ones appear constantly. With default deny, anything that was forgotten or never planned for stays blocked, and only the exact doors that legitimate services need are opened.

---

## 4. Baseline Port Audit

Before configuring the firewall, I deployed the Nginx container `secure-web-app` on port 8080 and listed every port the server was listening on with `ss -tulpn`. This gives a record of the attack surface while the server was still fully exposed.

| Port | Service | What It Means |
| :--- | :--- | :--- |
| **22** | `sshd` | The SSH service was listening on all addresses. This is the door administrators use for remote management. |
| **8080** | `docker-proxy` | The Nginx container's published port was listening on all addresses. This is the door the client's users need. |
| **40200, 40205, 40300, 40305** | `kc-terminal`, `node`, `runtime-scenari`, `runtime-info-se` | These ports belong to processes whose names suggest they are part of the KillerCoda playground itself. They also listen on all addresses. |
| **53, 68, 546** | `systemd-resolve`, `dhcpcd`, `systemd-network` | These are the server's own name resolution and network configuration services. |
| **38673** | `containerd` | The container runtime listened on the local address 127.0.0.1 only, so it was not reachable from outside the server. |

> [!NOTE]
> Several services were listening on all addresses before any firewall existed. A firewall does not stop a program from listening, so these entries are expected to remain in `ss` output after hardening. The firewall status in [firewall-configuration.md](firewall-configuration.md) is the evidence that unwanted incoming traffic is being blocked.

---

## 5. How These Concepts Apply to This Mission

| Concept | Application in This Lab |
| :--- | :--- |
| **Principle of Least Privilege** | The firewall is configured to let in only SSH for administrators and port 8080 for the web application, so each service receives only the access it needs. |
| **Attack Surface** | The firewall is meant to shrink the exposed ports on the server to the two the client needs. The test showed that Docker's published port 8080 is not fully controlled by UFW alone. |
| **Default Deny Policy** | The firewall denies all incoming traffic by default and allows outgoing traffic, with specific rules added afterward. |

---

## 6. Commands Used

| Command | What It Did |
| :--- | :--- |
| `docker run -d --name secure-web-app -p 8080:80 nginx` | Started an Nginx container named `secure-web-app` in the background with host port 8080 mapped to container port 80. |
| `docker ps` | Listed the running containers and confirmed that `secure-web-app` was up. |
| `curl http://localhost:8080` | Sent a request to the web server to confirm it was reachable. |
| `ss -tulpn` | Listed every TCP and UDP port the server was listening on, with the program behind each one. |

---

## 7. Evidence

<div align="center">

**Figure 1.** Application running before hardening

![Nginx container running and answering a curl request](screenshots/vulnerable-app-running.png)

**Figure 2.** Open ports before hardening

![Output of ss -tulpn listing the server's listening ports](screenshots/open-ports-audit.png)

</div>
