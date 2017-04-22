# vim: set filetype=make :
$(foreach mod_var,$(filter __build_module_%,$(.VARIABLES)),$(eval $(value $(mod_var))))

# Report possible typos.
$(if $(strip $(__build_possible_typos)),$(warning possible typos in following variables: $(sort $(__build_possible_typos))))

# Report unknown variables. Build should know about all the possible variables.
__build_unknown_vars = $(sort $(filter-out $(__build_known_vars),$(foreach var,$(.VARIABLES),$(if $(findstring file,$(origin $(var))),$(var)))))
$(if $(strip $(__build_unknown_vars)),$(warning the following variables are not known to Build: $(__build_unknown_vars)))

# Ensure that Buildfile is not setting VPATH
ifeq ($(origin VPATH),file)
$(error settinh VPATH is not allowed)
endif
