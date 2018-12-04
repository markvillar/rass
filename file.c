#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static char array[20];

char* fileOpen(char *filename, int select);
int read(char *argv);

int main (int argc, char **argv)
{
    char *det = "input.txt";
    char *output;

    int select = 1;

    if (argc > 1)
        select = read(argv[1]);
    output = fileOpen(det, select);

    printf("%s\n", output);
}

int read(char *argv)
{
    int word;

    printf("Which number word do you want selected? ");
    scanf("%d", &word);

    printf("word is %d\n", word);
    strcpy(array, argv);

    return word;
}

char* fileOpen(char *filename, int select)
{
    int x;

    FILE *f0;

    char *fileScan;

    fileScan = malloc(30);
    if ((f0 = fopen(filename, "r")) == NULL) {printf("Error\n"); exit(0);}

    for (x = 0; x < select; x++)
        fscanf(f0, "%s", fileScan);
    fscanf(f0, "%s", fileScan);
    fclose(f0);
    return fileScan;
}
