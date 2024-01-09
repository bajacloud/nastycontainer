#!/bin/bash

# Type: Process
# Policy: Compiler execution
# Execution:Process/CompilerExecutedInContainer

cat <<EOF > factorial.c
#include <stdio.h>

int factorial(int n) {
    return (n == 0) ? 1 : n * factorial(n - 1);
}

int main() {
    int num = 5;
    printf("Factorial of %d is %d\n", num, factorial(num));
    return 0;
}
EOF

gcc factorial.c -o factorial

./factorial
