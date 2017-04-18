=======
 build
=======

----------------------
pure-make build system
----------------------

:Author: me@zygoon.pl
:Date:   2017-04-18
:Copyright: Zygmmunt Krynicki
:Version: 0.1b
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

`build` takes the following command line options:

`--help`:
    Display available built-in help.
`--version`:
    Display version of `build`.
`-n`:
    Don't build anything, just print what you'd have done.
`-q`:
    Don't build anything but set the exit code to indicate if there is
    something to do.
`--out-of-tree DIR`:
    Build a project out of source tree. Built files will be placed in the
    current directory unless the `--in` option was used to change that
    location. The specified directory must contain the `Buildfile`.
`--in DIR`:
    Put all results in the specified directory. The directory is created if
    necessary. When used together with `--oot` the directory where `build` is
    invoked is totally detached from where it will write results to and where
    it loads source code from.

`build` understands several default targets:

`all` (default):
    Build everything, configuring the source tree if necessary
`clean` or `c`:
    Clean all build results.
`install` or `i`:
    Install all installable files (requires the UNIX module).
`defs`:
    Show extended information about what is defined in `Buildfile`.

ENVIRONMENT
===========

Internally `build` relies on `BUILD_INCLUDE_DIR`, `BUILD_PROJECT_ROOT` and
`MAKEFLAGS` and those variables are reserved.

In addition the `C` module understands a number of typical variables such as:
`CC`, `CXX`, `CFLAGS`, `CXXFLAGS`, `CPPFLAGS`, `LDFLAGS`, `LDLIBS` or
`CROSS_COMPILE`.

In addition the `UNIX` module understands `DESTDIR` and `prefix` as well as
several variables derived off prefix like `bindir`, `libdir` and others.

The `pkg-config` module is implicitly influenced by multiple variables that
affect pkg-config itself. Refer to pkg-config documentation for details. 

FILES
=====

`build` reads `Buildfile` as found in the current or any parent directory.

In addition the directory that contains the `Buildfile` can also contain:

`.build/*.check`:
    Location of additional, project specific checkers.
`.configure`:
    Directory with results of the configuration process (removed by `build
    clean`). Each subdirectory inside is named after a specific checker and
    contains build artefacts, log files and a fragment of `config.h`.
`config.h`:
    Automatically generated configuration file (removed by `build clean`)

System wide directories include:

`/usr/share/build/include/`:
    Location of build modules. You can install your custom build modules here.
`/usr/share/build/checkers/`:
    Location of autoconf-like checkers that are used by the _configure_ module.

BUGS
====

Build is in very early stages of development and it doesn't support building
static or shared libraries. Dependencies among object files and source code is
not tracked yet. Those features are under development and should be available
shortly.

Please report all other bugs at https://github.com/zyga/build/issues
