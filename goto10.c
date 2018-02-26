#include <stdio.h>
#include <stdlib.h>

char pickSlash(void);

int main(void) {
  srand(time(NULL));
  char chr;

  for (int i = 0; i < 10000; i++) {
    chr = pickSlash();
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
