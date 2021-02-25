#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>

#define SYSTEM "\e[0;95mSystem\e[0m"
#define FT "\e[0;92mft\e[0m"

size_t	ft_strlen(char *str);
ssize_t	ft_write(int fd, const void *str, unsigned int size);
int		ft_strcmp(const char *s1, const char *s2);
char	*ft_strdup(const char *s1);

#define FT_STRCMP(s1, s2)		printf("{[%s], [%s]} - ("SYSTEM"): %i, ("FT"): %i\n", s1, s2, strcmp(s1, s2), ft_strcmp(s1, s2));
#define FT_STRLEN(str)			printf("{%s} - (System): %ld, (ft): %ld\n", str, strlen(str), ft_strlen(str));
#define FT_WRITE(fd, str, size) printf("{%i, %s, %ld} - (System): %ld, (ft): %ld\n", fd, str, size, write(fd, str, size), ft_write(fd, str, size));
#define FT_STRDUP(str)			char *sys = strdup(str); \
								char *ft = ft_strdup(str); \
								printf("{%s} - (System): [%s], (ft): [%s]\n", str, sys, ft);\
								free(sys); \
								free(ft);

int main(int argc, char *argv[])
{
	(void)argc;
	FT_STRLEN(argv[1]);
	FT_WRITE(4, argv[1], strlen(argv[1]));
	printf("--- \e[1;36mft_strcmp\e[0m ---\n");
	FT_STRCMP("bonjour", "bonjour");
	FT_STRCMP("bonjour", "");
	FT_STRCMP("", "bonjour");
	FT_STRCMP("", "");
	FT_STRCMP(" ", " ");
	FT_STRCMP("Lorem", "Loreee");
	FT_STRCMP("    ", " ");
	FT_STRCMP("No", "ON");
	FT_STRDUP("Hello everyone");
	return 0;
}
