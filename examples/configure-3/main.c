#include <math.h>
#include <stdio.h>
#include <stdlib.h>

#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

int main()
{
    printf("Hello World\n");
#ifdef HAVE_CONFIG_H
	printf("You have \"config.h\"\n");
#endif
#ifdef HAVE_MATH_H
	printf("You have <math.h>\n");
#else
	printf("You don't have <math.h>\n");
#endif
#ifdef HAVE_FOOBAR_H
	printf("You have <foobar.h>\n");
#else
	printf("You don't have <foobar.h>\n");
#endif
    return 0;
}
