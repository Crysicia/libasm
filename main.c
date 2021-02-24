#include <stdio.h>
#include <string.h>
#include <unistd.h>

size_t	ft_strlen(char *str);
ssize_t	ft_write(int fd, const void *str, unsigned int size);
int ft_strcmp(const char *s1, const char *s2);
char *ft_strdup(const char *s1);

#define FT_STRLEN(str)			printf("{%s} - (System): %ld, (ft): %ld\n", str, strlen(str), ft_strlen(str));
#define FT_WRITE(fd, str, size) printf("{%i, %s, %ld} - (System): %ld, (ft): %ld\n", fd, str, size, write(fd, str, size), ft_write(fd, str, size));

int main(int argc, char *argv[])
{
	(void)argc;
	FT_STRLEN(argv[1]);
	FT_WRITE(2, argv[1], strlen(argv[1]));
	printf("%i\n", ft_strcmp(" ", "s"));
	printf("%s\n", ft_strdup("Yo les gens"));
	return 0;
}
