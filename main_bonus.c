#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>

typedef struct s_list
{
	void *data;
	struct s_list *next;
}				t_list;

int ft_atoi_base(char *str, char *base);
int	ft_list_size(t_list *lst);
int	ft_list_sizee(t_list **lst);
void	ft_lstadd_front(t_list **alst, void *data);
void ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void*));

void display_list(t_list *list)
{
	while (list)
	{
		printf("---\nContent: [%s]\nContent address: %p\nNext: %p\n", (char *)list->data, &list->data, list->next);
		list = list->next;
	}
}

int main(int argc, char *argv[])
{
	(void)argc;
	(void)argv;

	t_list	list;
	t_list	list_next;
	t_list	list_last;
	t_list *ptr;
	ptr = &list;

	list.data = strdup("foo");
	list.next = &list_next;
	list_next.data = strdup("bar");
	list_next.next = &list_last;
	list_last.data = strdup("baz");
	list_last.next = NULL;
	printf("LIST ADDRESS: %p\n", &list);
	// printf("List size: %i\n", ft_list_size(&list));
	printf("LIST ADDRESS: %p\n", &list);
	// printf("List size: %i\n", ft_list_sizee(&ptr));
	printf("LIST ADDRESS: %p\n", ptr);
	printf("List size: %i\n", ft_list_size(&list_last));
	printf("List size: %i\n", ft_list_size(NULL));

	t_list **pptr;
	pptr = &ptr;
	printf("LIST ADDRESS: %p\n", &list);
	printf("PPTR ADDRESS: %p\n", pptr);
	printf("PTR ADDRESS: %p\n", ptr);
	display_list(&list);
	ft_list_remove_if(pptr, "baz", strcmp, free);
	printf("AFTER REMOVE\n");
	display_list(ptr);
	printf("LIST ADDRESS: %p\n", &list);
	printf("PPTR ADDRESS: %p\n", pptr);
	printf("PTR ADDRESS: %p\n", ptr);
	free(list.data);
	free(list_next.data);
	free(list_last.data);
	// printf("VALID Return: %i\n", ft_atoi_base("  +23", "0123456789"));
	// printf("VALID Return: %i\n", ft_atoi_base("loool", "0123456789ABCDEF"));
	// printf("VALID Return: %i\n", ft_atoi_base("    ---++--aasasd", "0123456789ABCDEF"));
	// printf("VALID Return: %i\n", ft_atoi_base("--aasasd", "0123456789ABCDEF"));
	// printf("VALID Return: %i\n", ft_atoi_base("loool", "ponybase"));
	// printf("INVALID Return: %i\n", ft_atoi_base("loool", "dd"));
	// printf("INVALID Return: %i\n", ft_atoi_base("loool", "\t0123456789ABCDEF"));
	// printf("INVALID Return: %i\n", ft_atoi_base("loool", "\n0123456789ABCDEF"));
	// printf("INVALID Return: %i\n", ft_atoi_base("loool", "\r0123456789ABCDEF"));
	// printf("INVALID Return: %i\n", ft_atoi_base("loool", "\v0123456789ABCDEF"));
	// printf("INVALID Return: %i\n", ft_atoi_base("loool", "\f0123456789ABCDEF"));
	// printf("INVALID Return: %i\n", ft_atoi_base("loool", " 234"));
	// printf("INVALID Return: %i\n", ft_atoi_base("loool", "+2345"));
	// printf("INVALID Return: %i\n", ft_atoi_base("loool", "wer. 2"));





	return 0;
}
