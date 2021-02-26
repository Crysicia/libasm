#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>

int ft_atoi_base(char *str, char *base);

int main(int argc, char *argv[])
{
	(void)argc;
	(void)argv;
	printf("VALID Return: %i\n", ft_atoi_base("123456", "01"));
	printf("VALID Return: %i\n", ft_atoi_base("loool", "0123456789ABCDEF"));
	printf("VALID Return: %i\n", ft_atoi_base("    ---++--aasasd", "0123456789ABCDEF"));
	printf("VALID Return: %i\n", ft_atoi_base("--aasasd", "0123456789ABCDEF"));
	printf("VALID Return: %i\n", ft_atoi_base("loool", "ponybase"));
	printf("INVALID Return: %i\n", ft_atoi_base("loool", "dd"));
	printf("INVALID Return: %i\n", ft_atoi_base("loool", "\t0123456789ABCDEF"));
	printf("INVALID Return: %i\n", ft_atoi_base("loool", "\n0123456789ABCDEF"));
	printf("INVALID Return: %i\n", ft_atoi_base("loool", "\r0123456789ABCDEF"));
	printf("INVALID Return: %i\n", ft_atoi_base("loool", "\v0123456789ABCDEF"));
	printf("INVALID Return: %i\n", ft_atoi_base("loool", "\f0123456789ABCDEF"));
	printf("INVALID Return: %i\n", ft_atoi_base("loool", " 234"));
	printf("INVALID Return: %i\n", ft_atoi_base("loool", "+2345"));
	printf("INVALID Return: %i\n", ft_atoi_base("loool", "wer. 2"));
	return 0;
}
