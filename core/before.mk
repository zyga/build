# vim: set filetype=make :
# Default goal (overrides any user rules)
.DEFAULT_GOAL = all
# Disable old suffix rules (faster)
.SUFFIXES =
# Internal variable used for tracking variables with possible typos.
__build_possible_typos ?=
# Internal list of known variables / known variable patterns
__build_known_vars += .PHONY .DEFAULT_GOAL .SUFFIXES
__build_known_vars += __build_possible_typos __build_known_vars __build_unknown_vars __build_module_%
__build_known_vars += MAKEFILE_LIST MAKEFLAGS SHELL CURDIR

# Phony targets that just correspond to generic actions
.PHONY: all check clean install defs

# Phony targets that abbreviate common operations.
.PHONY: c
c: clean

.PHONY: i
i: install

.PHONY: help
help::
	@echo "Usage: build [options] [target]"
	@echo
	@echo " b[uild] [all]     - build/compile/generate everything (default)"
	@echo " b[uild] c[lean]   - remove all generated content"
	@echo " b[uild] i[nstall] - install everything, building it if necessary"
	@echo " b[uild] defs      - show all definitions"
	@echo " b[uild] check     - run tests if any are defined"
	@echo " b[uild] version   - show version of build itself"
	@echo
	@echo " --srcdir DIR      - get source code from DIR"
	@echo " --outdir DIR      - put build artefacts to DIR"

.PHONY: version
version::
	@echo "build version 0.1 gamma"
