<div align="center">

# Mission Reflection

**Laboratory 8: Cloud Security Engineer**
CCM101 Cloud Computing | University of Eastern Pangasinan

</div>

---

## 1. Host-Based Firewall Protection

The network perimeter is only the first wall. If someone gets past it, or is already inside the network, the firewall on the server still decides what can reach each port. In my lab I denied all incoming traffic and only allowed SSH and port 8080. Anything else had no rule letting it in.

---

## 2. Why Open Ports Matter

Every open port is a place where something can listen, and anything that listens can be attacked. When I ran `ss -tulpn`, I saw SSH on port 22, Docker's proxy on 8080, and several other ports listening on all addresses. I did not expect that many. Locking down the ports nobody needs leaves fewer services for an attacker to probe.

---

## 3. Open Database Ports

I did not run a database in this lab, so this answer comes from my reading. A database holds accounts, passwords, and file records. If port 3306 is open, anyone on the internet can try to log in or guess passwords. A database should only be reachable from the application that needs it. In Lab 6, my MariaDB container had no published port, so it could only be reached from inside the stack.

---

## 4. How My View Changed

A fresh server already had services listening on all addresses before I changed anything. That was the first surprise. The bigger one was my test. The `curl` to port 8080 worked before I added the allow rule. I read that Docker publishes ports with its own rules that can skip UFW. I only tested from the server itself, so I cannot say what an outside user would have seen.

---

## 5. My Portfolio Now

The spec mentions eight completed missions, and my repo now has Labs 1 to 8. Each lab has its own folder with documentation and screenshots, which makes it way easier to look back at what I did.
