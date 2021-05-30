#include<stdio.h>

int main()
{
    int s0 = 3;
    int s1 = 4;
    int s2 = 5;
    int a0 = 1;

    if(
        (s0+s1-s2) <= 0 ||
        (s1+s2-s0) <= 0 ||
        (s2+s0-s1) <= 0
    )
    {
        a0 = 0;
    }

    printf("a0 = %d\n", a0);
}