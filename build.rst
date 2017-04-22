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

`-n` `--just-print` `--dry-run` `--recon`:
    Don't build anything, just print the commands that would have been
    executed.
`-q`:
    Don't build anything but set the exit code to indicate if there is
    something to do.
`-v` `--verbose`:
    Be more talkative while building.
`-s` `--silent` `--quiet`:
    Be less talkative while building.
`--srcdir DIR` `--out-of-tree DIR` `--oot DIR`:
    Build a project out of source tree. Built files will be placed in the
    current directory unless the `--outdir` option was used to change that
    location. The specified directory must contain the `Buildfile`.
`--outdir DIR` `--in DIR`:
    Put all results in the specified directory. The directory is created if
    necessary. When used together with `--srcdir` the directory where `build`
    is invoked is totally detached from where it will write results to and
    where it loads source code from.

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

Internally `build` relies on `BUILD_INSTALLATION`, `BUILD_SRCDIR`,
`BUILD_OUTDIR`, `VPATH` and `MAKEFLAGS`. Those variables are reserved.

In addition the `C` module understands a number of typical variables such as:
`CC`, `CXX`, `CFLAGS`, `CXXFLAGS`, `CPPFLAGS`, `LDFLAGS`, `LDLIBS` or
`CROSS_COMPILE`.

In addition the `UNIX` module understands `DESTDIR` and `prefix` as well as
several variables derived off prefix like `bindir`, `libdir` and others.

The `pkg-config` module is implicitly influenced by multiple variables that
affect pkg-config itself. Refer to pkg-config documentation for details. 

FILES
=====

`build` reads `Buildfile` as found in the current or any parent directory
(unless `--srcdir` was provided then no lookup is performed).

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
    Location of modules that can be included in Buildfiles.
    Additional packages may install new modules here. 
`/usr/share/build/checkers/`:
    Location of checkers that are used by the configure module.
    Additional packages may install new checkers projects here.
`/usr/share/build/core/`:
    Internal files that make Build itself operate.
`/usr/share/build/examples/`:
    Various example projects illustrating particular features of Build.

BUGS
====

Build is in very early stages of development and it doesn't support building
static or shared libraries. Dependencies among object files and source code is
not tracked yet. Those features are under development and should be available
shortly.

Please report all other bugs at https://github.com/zyga/build/issues
