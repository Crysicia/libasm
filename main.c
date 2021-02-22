#include <stdio.h>
#include <string.h>
#include <unistd.h>
size_t	ft_strlen(char *str);
ssize_t	ft_write(int fd, const void *str, unsigned int size);

#define FT_STRLEN(str)			printf("{%s} - (System): %ld, (ft): %ld\n", str, strlen(str), ft_strlen(str));
#define FT_WRITE(fd, str, size) printf("{%i, %s, %ld} - (System): %ld, (ft): %ld\n", fd, str, size, write(fd, str, size), ft_write(fd, str, size));

int main(int argc, char *argv[])
{
	(void)argc;
	FT_STRLEN(argv[1]);
	FT_WRITE(2, argv[1], strlen(argv[1]));
	return 0;
}
