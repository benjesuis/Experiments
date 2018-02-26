#include <stdio.h>
#include <stdlib.h>
#include <time.h>

char pickSlash(void);
char pickLine(void);

int main(void) {
  srand(time(NULL));
  char chr;

  for (int i = 0; i < 10000; i++) {
    chr = pickSlash();
    //chr = pickLine();
    printf("%c", chr);
  }
  printf("\n");

  return 0;
}

char pickSlash(void) {
  char slash;

  int num = rand() % 100 + 1;
  if (num < 50) {
    slash = '//';
  } else {
    slash = '\\';
  }
  return slash;
}

char pickLine(void) {
  char line;
  
  int num = rand() % 150 + 1;
  if (num <= 100) {
    if (num < 50) {
      line = '//';
    } else {
      line = '\\';
    }
  } else {
    line = '|';
  }
  return line;
}
