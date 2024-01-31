#include <stdio.h>
#include <unistd.h>

/**
 * Simple streaming programming in C language.
 */
int main()
{
  char s[4096];
  for (
    size_t l;
    (l = fread(s, sizeof *s, sizeof s / sizeof *s, stdin));
    fwrite(s, sizeof *s, l / sizeof *s, stdout)
  );
  return 0;
}
