#include<stdio.h>

int main()
{
    int t0 = 0;
    int t1 = 100;
    int t2 = 0;

    for (t0 = 0; t0 < t1; t0++)
    {
        t2 += t0;
    }

    printf("t2 = %d\n", t2);
}