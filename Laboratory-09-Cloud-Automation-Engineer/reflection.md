# Mission Reflection

---

## 1. Why Automation Matters at Scale

Typing commands on one server is manageable. On hundreds of servers, the same task means hundreds of chances to forget a step or mistype a path. A script repeats the same steps every time, and cron runs it without anyone remembering. The client in this lab lost customer files because someone forgot a weekly backup.

---

## 2. The Dangers of Automation

Automation repeats mistakes as reliably as it repeats good work. A destructive typo in a script scheduled on 1,000 servers would run on all of them at the same time, with nobody watching. My own script has smaller versions of this risk. It uses relative paths, so it only works from /root, and it never deletes old backups.

---

## 3. Bash Script vs Docker Compose File

The Compose file in Lab 6 described the end result, two containers with their images, ports, and variables, and Compose worked out how to start them. The Bash script is a list of steps that run in order, so I had to think about the sequence myself.

---

## 4. How My Understanding Has Changed

In Lab 1 I kept blanking on commands like mkdir and pwd. In this lab I wrote a script, fixed its permissions, and scheduled it. I also learned to check that a tool still exists, like the MinIO image in Lab 5 and MariaDB 10.6 in Lab 6, and to read the output before assuming a command worked. My portfolio now has eight completed labs, and Lab 3 is still Not Started.

---

## 5. The Role I Enjoyed Most

Cloud Data Engineer wins for me, and it was not even close. Lab 5 was the first time the cloud felt like a real place where things live, because I created a bucket and put a file into it myself. That small win made me grin at my screen. Then the original MinIO image turned out to be unavailable, and instead of giving up I read the error, hunted down a working image, and got it running anyway. Fixing it felt better than a smooth run would have. This lab gave me the same buzz, since a backup and a bucket both come down to keeping data safe and knowing exactly where it is.
