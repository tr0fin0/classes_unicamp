#include<stdio.h>

int main()
{
    int n = 10;
    int v[n];

    for(int i = 0; i < n; i++)
    {
        v[i] = i;
    }

    int m;

    for(int i = 0; i < n; i++)
    {
        if(v[i] < m)
        {
            m = v[i];
        }
    }

    printf("%d\n",m);
}