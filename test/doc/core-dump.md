## Generate core dump
A core dump is a copy of your program’s memory, and it’s useful when you’re trying to debug what went wrong with your problematic program.

When your program segfaults, the Linux kernel will sometimes write a core dump to disk. When I originally tried to get a core dump, I was pretty frustrated for a long time because – Linux wasn’t writing a core dump!! Where was my core dump????

Here’s what I ended up doing:

- Run ulimit -c unlimited before starting my program

LINK: https://jvns.ca/blog/2018/04/28/debugging-a-segfault-on-linux/

## core dump analysis
Debugging core dumps on OS X
EDIT
Created 2/29/2016, updated 10/15/2017
$ ulimit -c unlimited # Enable core dumps.
$ ls -lt /cores # Identify latest core dump.
$ lldb -c /cores/core.12345
> bt all
See also
https://developer.apple.com/library/mac/technotes/tn2124/_index.html
http://lldb.llvm.org/lldb-gdb.html
core.dumpmacoswiki

LINK: https://wincent.com/wiki/Debugging_core_dumps_on_OS_X