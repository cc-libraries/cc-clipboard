## How to get a core dump
A core dump is a copy of your program’s memory, and it’s useful when you’re trying to debug what went wrong with your problematic program.

When your program segfaults, the Linux kernel will sometimes write a core dump to disk. When I originally tried to get a core dump, I was pretty frustrated for a long time because – Linux wasn’t writing a core dump!! Where was my core dump????

Here’s what I ended up doing:

- Run ulimit -c unlimited before starting my program
- Run sudo sysctl -w kernel.core_pattern=/tmp/core-%e.%p.%h.%t


https://jvns.ca/blog/2018/04/28/debugging-a-segfault-on-linux/