#include <stdio.h>
#include "t2w.h"

int
main(int argc, char *argv[])
{
  printf("t2w version %d.%02d\n", (T2W_VERSION/100), (T2W_VERSION%100));
  return 0;
}
