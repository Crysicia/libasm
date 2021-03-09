#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <fcntl.h>
#include <errno.h>

#define SYSTEM "\e[0;95mSystem\e[0m"
#define FT "\e[0;92mft\e[0m"

#define READ_SIZE 10
#define GREEN "\e[0;32m"
#define RED "\e[0;31m"
#define RESET "\e[0m"

size_t	ft_strlen(char *str);
ssize_t	ft_write(int fd, const void *buf, size_t count);
ssize_t	ft_read(int fd, void *buf, size_t count);
int		ft_strcmp(const char *s1, const char *s2);
char	*ft_strdup(const char *s1);
char	*ft_strcpy(char *dest, const char *src);

int lulutest(int i);

#define FT_STRCMP(s1, s2)		printf("{[%s], [%s]} - ("SYSTEM"): %i, ("FT"): %i\n", s1, s2, strcmp(s1, s2), ft_strcmp(s1, s2));
#define FT_STRLEN(str)			printf("{%s} - (System): %ld, (ft): %ld\n", str, strlen(str), ft_strlen(str));
#define FT_WRITE(fd, str, size) printf("{%i, %s, %ld} - (System): %ld, (ft): %ld\n", fd, str, size, write(fd, str, size), ft_write(fd, str, size));
#define FT_STRDUP(str)			char *sys = strdup(str); \
								char *ft = ft_strdup(str); \
								printf("{%s} - (System): [%s], (ft): [%s]\n", str, sys, ft);\
								free(sys); \
								free(ft);


void test_strlen(char *str)
{
	char *status = RED;
	size_t system = strlen(str);
	size_t ft = ft_strlen(str);

	if (ft == system)
		status = GREEN;
	printf("%s(System): %4ld, (ft): %4ld - [%s]"RESET"\n", status, system, ft, str);
}

void test_strcmp(char *s1, char *s2)
{
	char *status = RED;
	size_t system = strcmp(s1, s2);
	size_t ft = ft_strcmp(s1, s2);

	if (ft == system)
		status = GREEN;
	printf("%s(System): %4ld, (ft): %4ld - [%s], [%s]"RESET"\n", status, system, ft, s1, s2);
}

void test_read(char *filepath)
{
	char *status = RED;

	char system_buf[READ_SIZE + 1];
	char ft_buf[READ_SIZE + 1];

	int system_fd = open(filepath, O_RDONLY);
	int ft_fd = open(filepath, O_RDONLY);

	size_t system = read(system_fd, system_buf, READ_SIZE);
	int system_errno = errno;

	size_t ft = ft_read(ft_fd, ft_buf, READ_SIZE);
	int ft_errno = errno;

	system_buf[system] = 0;
	ft_buf[ft] = 0;
	if (ft == system && !strcmp(system_buf, ft_buf) && ft_errno == system_errno)
		status = GREEN;
	printf("%s(System): %4ld, (ft): %4ld - [%s]\n-- ERRNO: (System): %d, (ft): %d\n-- (System buffer): %s\n-- (Ft buffer): %s\n"RESET, status, system, ft, filepath, system_errno, ft_errno, system_buf, ft_buf);
}

// void test_write(int fd)
// {

// }

// void test_strdup(char *str)
// {

// }

// void test_strcpy(char *str)
// {

// }

int main(int argc, char *argv[])
{
	(void)argc;
	// printf("Greater: %i, Equal: %i, Less: %i\n", lulutest(50), lulutest(42), lulutest(0));
	FT_STRLEN(argv[1]);
	FT_WRITE(4, argv[1], strlen(argv[1]));
	printf("--- \e[1;36mft_strlen\e[0m ---\n");
	char dest[100];

	printf("--- \e[1;36mft_strlen\e[0m ---\n");
	test_strlen("");
	test_strlen("Bonjour");
	test_strlen("Hello world!");


	printf("--- \e[1;36mft_strcmp\e[0m ---\n");
	test_strcmp("", "");
	test_strcmp("", "Bonjour");
	test_strcmp("Bonjour", "");
	test_strcmp("Bon", "Bonjour");
	test_strcmp("Bonjour", "Bonjour");

	printf("--- \e[1;36mft_read\e[0m ---\n");
	test_read("main.c");
	test_read("Makefile");
	test_read("ft_strlen.s");
	printf("[%s]\n", ft_strcpy(dest, "hello"));
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
