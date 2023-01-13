
#include <stdio.h>

void secret_scipy();

void scipy_a()
{
    secret_scipy();
}

void secret_scipy()
{
    fprintf(stderr, "Hello from scipy_a\n");
}
