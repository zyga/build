=======
 build
=======

----------------------
pure-make build system
----------------------

:Author: me@zygoon.pl
:Date:   2017-04-16
:Copyright: Zygmmunt Krynicki
:Version: 0.1a
:Manual section: 1

SYNOPSIS
========

	build [OPTIONS] TARGET...

DESCRIPTION
===========

`build` is a thin wrapper around GNU make. It reads `Buildfile` instead of
traditional `Makefile` and it comes with a set of rules for building C/C++
programs.

OPTIONS
=======

The `build` program takes the same options as `make` with the following
exceptions. 

The `--file` and `--directory` options are used as internally and are
unsupported. The `--jobs` (or `-j`) option is handled automatically. Several
less common Make options are enabled by default. For details see the source
code of the `build` script.

ENVIRONMENT
===========

Internally `build` relies on `BUILD_INCLUDE_DIR` and `MAKEFLAGS` and those
variables are reserved.

FILES
=====

`build` reads `Buildfile` as found in the current or any parent directory.

`/usr/share/build/include/`

    Location of build modules. You can install your custom build modules here.
    See the build-in C module for inspiration.

BUGS
====

Build is in very early stages of development and it doesn't support building
static or shared libraries. Dependencies among object files and source code is
not tracked yet. Those features are under development and should be available
shortly.

Please report all other bugs at https://github.com/zyga/build/issues
