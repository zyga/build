# Build, the pure-Make build system

Build is a new experimental build system designed for building C/C++ programs.
Internally build relies GNU Make but sheds nearly everything that isn't needed.

Build doesn't yet offer autoconf-style configuration or support for shared
libraries.

# Installation

Copy the source code somewhere and add "build" to your PATH. Alternatively
build and install the Debian package.

You will need GNU "make" and you can also take advantage of "pkg-config".
