# Mission Reflection

## Boot Time and Setup: Containers vs. VMs

The difference in boot time is honestly the first thing that stood out. Booting a
VM means waiting for an entire operating system to come up before you can even
think about running your application — I've had that take [X minutes] in earlier
labs. A container skipped all of that. `docker run` and the Nginx server was up in
under a couple of seconds, because it's not booting anything, just starting a
process on top of the kernel the host already has running. It's a small thing to
read about but a different thing to actually watch happen in your own terminal.

## Why Port Mapping Matters

`-p 8080:80` confused me a little at first, until I thought about it as two
separate networks. Nginx is listening on port 80, but that's port 80 *inside* the
container — as far as the host machine is concerned, that port doesn't exist. The
mapping is what connects host port 8080 to container port 80, so `curl
localhost:8080` on my end actually has somewhere to go. Without it, the server
would be running perfectly fine and still be completely unreachable.

## What Happens to Data on `docker rm`

This is the one I'd probably get wrong if I hadn't just done it. `docker rm` doesn't
just stop the container — it deletes it, and whatever was written inside that
container's writable layer goes with it. Containers aren't built to hold onto data;
they're meant to be disposable. If something actually needs to persist — a
database, uploaded files, whatever — that has to live in a Docker volume instead,
which sits outside the container's lifecycle entirely.

## Containerization and DevOps

I think this is where containers actually earn their reputation. A developer builds
an image with everything the app needs baked in, and that exact image is what runs
in testing and in production — not a "close enough" copy of it. That's what kills
the "works on my machine" problem: there's no separate environment to drift out of
sync, because it's the same one every time. It changes the working relationship
too, since ops isn't debugging a different setup than what the developer actually
built.

## How My GitHub Portfolio Is Evolving

While working on this laboratory activity, my GitHub repo is progressing steadily.
Beyond that, I'm also finding lessons and subjects that align more with my
interests, particularly in technology; this field has proven to be my forte in
ways I'm still figuring out. Looking back, CCM101 showed me that my interest in
homelabbing has evolved: I started out building PCs from spare hardware, and now
I'm building cloud services using whatever parts I can find and repurpose, whether
that's an old-gen setup or something newer. It's proof to myself that I can strive
and thrive in the IT field.
