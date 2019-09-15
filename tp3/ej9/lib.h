#ifndef __libh
#define __libh

#define MY_EOF -1
#define STDIN 0
#define STDOUT 1

#define R 0
#define W 1
#define RW 2

typedef struct FileCDT * File;

int my_getchar();

File my_fopen(char * name, int mode);
void my_fclose(File file);

int puts(const char * str);

char * read_line(File file, unsigned int max_size);
char * get_line(unsigned int max_size);
char * to_string(unsigned int number);

#endif