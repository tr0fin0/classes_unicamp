#include<stdio.h>
#include <stdlib.h>

// Implemente um programa em Assembly do RISC-V que leia um número N na entrada (considere valores de N positivos) e em seguida leia N strings de no máximo 20 caracteres cada para, ao fim, imprimir todas elas da última digitada para a primeira digitada.

int main()
{
    int size_string = 20;

    int number_strings;                         // declare constant N
    scanf("%d", &number_strings);               // ecall to read integer

    char array[number_strings][size_string];    // save space in memory

    for(int i = 0; i < number_strings; i++)     // loops with ecall reading strings
    {
        scanf("%s", array[i]);
    }

    // note that the last input must discosidered because it is \0
    for(int i = number_strings-1; i >= 0; i--)  // loops with ecall printing strings
    {
        printf("%s\n", array[i]);
    }
}