#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <fcntl.h>
#include <errno.h>

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

void test_write(int fd, char *str, int size)
{
	char *status = RED;

	size_t system = write(fd, str, size);
	int system_errno = errno;
	size_t ft = ft_write(fd, str, size);
	int ft_errno = errno;

	if (ft == system && ft_errno == system_errno)
		status = GREEN;
	printf("%s(System): %4ld, (ft): %4ld\n-- ERRNO: (System): %d, (ft): %d"RESET"\n", status, system, ft, system_errno, ft_errno);

}

void test_strdup(char *str)
{
	char *status = RED;
	char *system = strdup(str);
	char *ft = ft_strdup(str);

	if (!strcmp(ft, system))
		status = GREEN;
	printf("%s(System): %s, (ft): %s - [%s]"RESET"\n", status, system, ft, str);
	free(system);	
	free(ft);	
}

void test_strcpy(char *str)
{
	char *status = RED;
	char system_buf[100];
	char ft_buf[100];
	char *system = strcpy(system_buf, str);
	char *ft = ft_strcpy(ft_buf, str);

	if (!strcmp(ft, system) && !strcmp(ft_buf, system_buf))
		status = GREEN;
	printf("%s(System): %s, (ft): %s - [%s]"RESET"\n", status, system_buf, ft_buf, str);
}

int main(void)
{
	printf("--- \e[1;36mft_strlen\e[0m ---\n");
	test_strlen("");
	test_strlen("Bonjour");
	test_strlen("Hello, world!");

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
	test_read("/dev/null");

	printf("--- \e[1;36mft_write\e[0m ---\n");
	test_write(0, "Hello, world!\n", 14);
	test_write(0, "Hello, world!\n", 1);
	test_write(1, "Hello, world!\n", 14);
	test_write(2, "Hello, world!\n", 14);
	test_write(42, "Hello, world!\n", 14);

	printf("--- \e[1;36mft_strdup\e[0m ---\n");
	test_strdup("");
	test_strdup("Hi\0");
	test_strdup("Hidden\0Secret");
	test_strdup("Im a normal string");

	printf("--- \e[1;36mft_strcpy\e[0m ---\n");
	test_strcpy("test");
	test_strcpy("\0");
	test_strcpy("Copy copy copy");
	return 0;
}
