# Container Observability Report

**CCM101 Cloud Computing | Laboratory 07: Cloud Operations Engineer**

---

## Summary of Findings

| Area | Result |
|---|---|
| **Requests Served** | The `client-website` container returned three 200 responses and one 404 response. |
| **Memory Use** | The container used 2.738 MiB of memory, which is 0.14% of the host's memory. |
| **CPU Use** | The container used 0.00% of CPU while idle. |

These readings describe a baseline footprint. They are not a load test.

---

## Overview

This report documents the application logs and live metrics for the `client-website` Nginx container that serves your marketing site. The container was started with Docker and sent three normal requests and one request for a page that does not exist. I then inspected it using Docker's built-in tools.

---

## Application Logs

I retrieved the container's logs with `docker logs client-website`. They showed three successful requests with status 200 and one failed request with status 404. This is the single log line that records the 404 error:

```
172.17.0.1 - - [10/Oct/2026:16:01:10 +0000] "GET /hidden-admin-page HTTP/1.1" 404 153 "-" "curl/8.5.0" "-"
```

Nginx also wrote a separate `[error]` line explaining that the requested file does not exist on the server.

---

## Reading the Log Entries

| Request | Time (UTC) | Status | What It Shows |
|---|---|---|---|
| **Request 1** | 16:00:00 | 200 | Your first visit to the home page succeeded. |
| **Request 2** | 16:00:18 | 200 | Your second visit to the home page succeeded. |
| **Request 3** | 16:00:31 | 200 | Your third visit to the home page succeeded. |
| **Request 4** | 16:01:10 | 404 | The request for `/hidden-admin-page` failed because that page does not exist. |

Each line also records the client address `172.17.0.1`, which is the gateway of Docker's default bridge network, and the client type `curl/8.5.0`, which identifies my test tool.

---

## Why Application Logs Matter

Your application logs record every request your server receives, including the time, the page that was requested, and the status code that came back. When a user reports a problem, your team can use them to see exactly what happened. A single line like the 404 above shows which page failed and when, so your engineers do not have to guess.

---

## Real-Time Container Metrics

I viewed the container's live resource use with `docker stats`. At the time of my screenshot, the `client-website` container was using these resources:

| Metric | Value at Screenshot Time |
|---|---|
| **Memory Usage** | The container was using 2.738 MiB of memory out of a 1.859 GiB limit, which is 0.14% of the host's memory. |
| **CPU Percentage** | The container was using 0.00% of CPU. |
| **Network I/O** | The container had received 3.8 kB and sent 5.25 kB, which is consistent with the small amount of traffic I sent. |

**Limitation:** These readings were taken while the container was idle, so they describe its baseline footprint and are not a load test.

---

## Why Metrics Matter

Metrics show how much of your server's capacity the container is using at any moment, which is what your team needs to judge whether the site can handle a surge in visitors. Logs tell you what happened, and metrics tell you how hard the system is working while it happens.

---

## Commands Used

| Command | What It Did |
|---|---|
| `docker logs client-website` | Printed the container's output, including the 200 and 404 request lines. |
| `docker logs client-website 2>&1 \| grep " 404 "` | Filtered the output down to the log line that contains the 404 status. |
| `docker stats` | Displayed a live view of the container's CPU, memory, network, and disk use. |

---

## Evidence

### Container Deployment

![Nginx container started and listed as running](screenshots/install-nginx.png)

### Successful Requests

![Successful curl requests to the website](screenshots/simulation1.png)

### Failed Request

![curl request that returned a 404 Not Found page](screenshots/simulation2.png)

### Container Logs

![Output of docker logs client-website](screenshots/docker-logs.png)

### Container Metrics

![Output of docker stats for the client-website container](screenshots/container-metrics.png)
