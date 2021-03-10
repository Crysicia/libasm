#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>

#define GREEN "\e[0;32m"
#define RED "\e[0;31m"
#define RESET "\e[0m"

typedef struct s_list
{
	void *data;
	struct s_list *next;
}				t_list;

int 	ft_atoi_base(char *str, char *base);
int		ft_list_size(t_list *lst);
int		ft_list_sizee(t_list **lst);
void	ft_list_push_front(t_list **alst, void *data);
void 	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void*));
void	ft_list_sort(t_list **begin_list, int (*cmp)());

void display_list(t_list *list)
{
	while (list)
	{
		printf("----- %p\nContent: [%s]\nContent address: %p\nNext: %p\n", list, (char *)list->data, list->data, list->next);
		list = list->next;
	}
}

t_list **generate_list(void)
{
	t_list **list = malloc(sizeof(t_list *));
	ft_list_push_front(list, strdup("aaaa"));
	ft_list_push_front(list, strdup("vvvv"));
	ft_list_push_front(list, strdup("dddd"));
	ft_list_push_front(list, strdup("aaaa"));
	ft_list_push_front(list, strdup("bbbb"));
	ft_list_push_front(list, strdup("cccc"));
	ft_list_push_front(list, strdup("aaaa"));
	return (list);
}

void free_list(t_list *list)
{
	t_list *old;
	while (list)
	{
		free(list->data);
		old = list;
		list = list->next;
		free(old);
	}
}

void print_list(t_list *list)
{
	while (list)
	{
		printf("[%s] -> ", (char *)list->data);
		list = list->next;
	}
	printf("END\n");
}

void test_list_size(t_list *list, int expected_size)
{
	char *status = RED;
	int output = ft_list_size(list);

	if (output == expected_size)
		status = GREEN;
	printf("%s(Expected): %4d, (Output): %4d\n-- List:\n-- ", status, expected_size, output);
	print_list(list);
	printf(RESET);
}

void test_list_push_front(t_list *list, void *data, int expected_size)
{
	char *status = RED;

	ft_list_push_front(&list, data);
	int size_after = ft_list_size(list);
	if (size_after == expected_size)
		status = GREEN;
	printf("%s(Expected): %4d, (Output): %4d\n-- List:\n-- ", status, expected_size, size_after);
	print_list(list);
	printf(RESET);
}

void test_list_remove_if(t_list **list, char *to_remove, int expected_size)
{
	char *status = RED;

	ft_list_remove_if(list, to_remove, strcmp, free);
	int size_after = ft_list_size(*list);
	if (size_after == expected_size)
		status = GREEN;
	printf("%s(Expected): %4d, (Output): %4d\n-- List:\n-- ", status, expected_size, size_after);
	print_list(*list);
	printf(RESET);
}

void test_list_sort(t_list *list)
{
	char *status = RED;

	int size_before = ft_list_size(list);
	printf("Before:\n-- ");
	print_list(list);
	ft_list_sort(&list, strcmp);
	int size_after = ft_list_size(list);
	if (size_before == size_after)
		status = GREEN;
	printf("%sAfter\n-- ", status);
	print_list(list);
	printf(RESET);
}

void test_atoi_base(char *str, char *base, int expected)
{
	char *status = RED;
	int output = ft_atoi_base(str, base);
	if (expected == output)
		status = GREEN;
	printf("%s(Expected): %4d, (Output): %4d - [%s], [%s]"RESET"\n", status, expected, output, str, base);
}

int main(void)
{
	t_list	*list = malloc(sizeof(t_list));
	t_list	*list_next = malloc(sizeof(t_list));
	t_list	*list_next_next = malloc(sizeof(t_list));
	t_list	*list_last = malloc(sizeof(t_list));

	list->data = strdup("w");
	list->next = list_next;
	list_next->data = strdup("x");
	list_next->next = list_next_next;
	list_next_next->data = strdup("y");
	list_next_next->next = list_last;
	list_last->data = strdup("z");
	list_last->next = NULL;
	test_list_size(list, 4);
	test_list_size(NULL, 0);

	test_list_push_front(list, strdup("FRONT"), 5);
	test_list_push_front(list, NULL, 4);
	t_list **pptr;
	pptr = generate_list();
	test_list_remove_if(pptr, "aaaa", 4);
	test_list_sort(*pptr);
	printf("--- \e[1;36mft_atoi_base\e[0m ---\n");
	test_atoi_base("1337", "0123456789", 1337);
	// print_list(*pptr);
	// display_list(*pptr);



	// printf("LIST ADDRESS: %p\n", list);
	// printf("PPTR ADDRESS: %p\n", *pptr);
	// // ft_list_push_front(pptr, strdup("i"));
	// // ft_list_push_front(pptr, strdup("h"));
	// // ft_list_push_front(pptr, strdup("g"));
	// // ft_list_push_front(pptr, strdup("f"));
	// // ft_list_push_front(pptr, strdup("e"));
	// ft_list_push_front(pptr, strdup("a"));
	// // ft_list_push_front(pptr, strdup("d"));
	// // ft_list_push_front(pptr, strdup("c"));
	// // ft_list_push_front(pptr, "DELETE");
	// ft_list_push_front(pptr, strdup("b"));
	// printf("PPTR ADDRESS: %p\n", *pptr);
	// printf("\n\n\n\n\n");
	// display_list(*pptr);
	// printf("REMOVING:\n\n\n\n\n");
	// ft_list_remove_if(pptr, "w", strcmp, free);
	// ft_list_remove_if(pptr, "x", strcmp, free);
	// ft_list_remove_if(pptr, "y", strcmp, free);
	// ft_list_remove_if(pptr, "x", strcmp, free);
	// printf("\n\n\n\n\n --- AFTER REMOVE ---\n\n\n\n\n");
	// display_list(*pptr);
	// printf("\n\n\n\n\n");
	// printf("---- SORT ----\n\n\n\n");
	// ft_list_sort(pptr, strcmp);
	// display_list(*pptr);
	// free_list(*pptr);
	// printf("LIST ADDRESS: %p\n", list);
	// printf("PPTR ADDRESS: %p\n", pptr);
	// free(list.data);
	// free(list_next.data);
	// free(list_last.data);
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
