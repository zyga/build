#include <stdlib.h>
#include <stdio.h>

#include <sys/capability.h>

int main() {
	cap_value_t cap;
	if (cap_from_name("cap_setgid", &cap) < 0) {
		perror("cannot resolve capability name");
	}
	printf("Hello World\n");
	return 0;
}
