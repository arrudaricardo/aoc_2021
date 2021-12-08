#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void) {

  unsigned long n[] = {0, 0, 0, 0, 0, 0, 0, 0, 0};

  char LIST[] = {
      5, 4, 3, 5, 1, 1, 2, 1, 2, 1, 3, 2, 3, 4, 5, 1, 2, 4, 3, 2, 5, 1, 4, 2,
      1, 1, 2, 5, 4, 4, 4, 1, 5, 4, 5, 2, 1, 2, 5, 5, 4, 1, 3, 1, 4, 2, 4, 2,
      5, 1, 3, 5, 3, 2, 3, 1, 1, 4, 5, 2, 4, 3, 1, 5, 5, 1, 3, 1, 3, 2, 2, 4,
      1, 3, 4, 3, 3, 4, 1, 3, 4, 3, 4, 5, 2, 1, 1, 1, 4, 5, 5, 1, 1, 3, 2, 4,
      1, 2, 2, 2, 4, 1, 2, 5, 5, 1, 4, 5, 2, 4, 2, 1, 5, 4, 1, 3, 4, 1, 2, 3,
      1, 5, 1, 3, 4, 5, 4, 1, 4, 3, 3, 3, 5, 5, 1, 1, 5, 1, 5, 5, 1, 5, 2, 1,
      5, 1, 2, 3, 5, 5, 1, 3, 3, 1, 5, 3, 4, 3, 4, 3, 2, 5, 2, 1, 2, 5, 1, 1,
      1, 1, 5, 1, 1, 4, 3, 3, 5, 1, 1, 1, 4, 4, 1, 3, 3, 5, 5, 4, 3, 2, 1, 2,
      2, 3, 4, 1, 5, 4, 3, 1, 1, 5, 1, 4, 2, 3, 2, 2, 3, 4, 1, 3, 4, 1, 4, 3,
      4, 3, 1, 3, 3, 1, 1, 4, 1, 1, 1, 4, 5, 3, 1, 1, 2, 5, 2, 5, 1, 5, 3, 3,
      1, 3, 5, 5, 1, 5, 4, 3, 1, 5, 1, 1, 5, 5, 1, 1, 2, 5, 5, 5, 1, 1, 3, 2,
      2, 3, 4, 5, 5, 2, 5, 4, 2, 1, 5, 1, 4, 4, 5, 4, 4, 1, 2, 1, 1, 2, 3, 5,
      5, 1, 3, 1, 4, 2, 3, 3, 1, 4, 1, 1};

  for (int i = 0; i < sizeof(LIST) / sizeof(LIST[0]); i++) {
    for (int j = 0; j < 9; j++) {
      if (LIST[i] == j) {
        n[j] += 1;
        break;
      }
    }
  }

  int day = 0;
  int maxDay = 256;

  while (day <= maxDay - 1) {

    unsigned long temp0 = n[0];
    unsigned long temp1 = n[1];
    unsigned long temp2 = n[2];
    unsigned long temp3 = n[3];
    unsigned long temp4 = n[4];
    unsigned long temp5 = n[5];
    unsigned long temp6 = n[6];
    unsigned long temp7 = n[7];
    unsigned long temp8 = n[8];

    n[0] = temp1;
    n[1] = temp2;
    n[2] = temp3;
    n[3] = temp4;
    n[4] = temp5;
    n[5] = temp6;
    n[6] = temp7 + temp0;
    n[7] = temp8;
    n[8] = temp0;

    if (day == 79) {
      long total = 0;
      for (int j = 0; j < 9; j++) {
        total += n[j];
      }
      printf("Solution 1: %ld", total);
    }

    day++;
  }

  printf("\n");

  long total = 0;
  for (int j = 0; j < 9; j++) {
    total += n[j];
  }

  printf("Solution 2: %ld", total);

  return 0;
}
