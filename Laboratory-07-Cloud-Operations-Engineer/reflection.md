# Mission Reflection

---

## Question 1: Why Check the Host Server's Resources

A healthy container does not guarantee a healthy server. The memory limit shown by `docker stats` was 1.859 GiB, which is nearly all of the host's 1.9 GiB of RAM, so the container and the host draw from one shared pool. Disk works the same way. The root file system is 19 GB with 5.5 GB already used, so a full disk would take Nginx down with it even if the container itself had no fault.

---

## Question 2: Using `docker logs` for a Login Complaint

I would run `docker logs` on the container and look at the time the user tried to log in. In this lab I found the 404 by reading the status codes and the timestamp, so I would look for an error code or an error line near that time. The log shows which page failed and when, so I am not guessing.

---

## Question 3: Logs vs Metrics

Logs record events. The 404 line told me which page was requested and that it failed. Metrics describe how the system is doing right now. `docker stats` showed 0.00% CPU and 2.738 MiB of memory, but it could not tell me what anyone asked for. I need the logs to explain what happened and the metrics to show the load.

---

## Question 4: Monitoring Thousands of Containers

I think `docker stats` cannot scale to thousands of containers, because it shows one machine in one terminal. From Chapter 7, I understand that Prometheus collects metrics from every container automatically and Grafana turns them into dashboards and alerts. I have not used either yet, so this is my understanding from the reading.

---

## Question 5: Troubleshooting Growth

I ran into a few problems. The `top` screen paused and I had to work out how to exit it. A stray pasted line gave me a bash syntax error, so I checked the logs to make sure it had not sent an extra request. Using `grep` to pull out the single 404 line was new for me. I now check the output before I assume a command worked.
