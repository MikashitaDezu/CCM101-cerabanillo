# Docker Deployment Log

## Container Lifecycle Commands

The commands below were used to manage the Nginx container after deployment,
from verifying that it was running through to removing it from the environment.

| Command | Description |
|---|---|
| `docker ps` | Listed the running containers and confirmed that `nginx-server` was active. |
| `docker stop nginx-server` | Sent a shutdown signal to `nginx-server`, ending the running process. |
| `docker ps -a` | Listed all containers regardless of state, showing `nginx-server` with an `Exited` status. |
| `docker rm nginx-server` | Deleted the stopped `nginx-server` container and its writable layer from the host. |

Note that `docker rm` only succeeds on a container that has already been stopped,
which is why the stop command must come first.

## Evidence

![Container lifecycle commands executed in the KillerCoda terminal](screenshots/container-lifecycle.png)
