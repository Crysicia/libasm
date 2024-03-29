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

t_list **generate_7_nodes(void)
{
	t_list **list = malloc(sizeof(t_list **));
	t_list *one = malloc(sizeof(t_list));
	t_list *two = malloc(sizeof(t_list));
	t_list *three = malloc(sizeof(t_list));
	t_list *four = malloc(sizeof(t_list));
	t_list *five = malloc(sizeof(t_list));
	t_list *six = malloc(sizeof(t_list));
	t_list *seven = malloc(sizeof(t_list));

	one->data = strdup("aaaa");
	two->data = strdup("cccc");
	three->data = strdup("bbbb");
	four->data = strdup("aaaa");
	five->data = strdup("dddd");
	six->data = strdup("vvvv");
	seven->data = strdup("aaaa");

	one->next = two;
	two->next = three;
	three->next = four;
	four->next = five;
	five->next = six;
	six->next = seven;
	seven->next = NULL;

	*list = one;
	return (list);
}

t_list **generate_5_nodes(void)
{
	t_list **list = malloc(sizeof(t_list *));
	t_list *one = malloc(sizeof(t_list));
	t_list *two = malloc(sizeof(t_list));
	t_list *three = malloc(sizeof(t_list));
	t_list *four = malloc(sizeof(t_list));
	t_list *five = malloc(sizeof(t_list));

	one->data = strdup("Alpha");
	two->data = strdup("Beta");
	three->data = strdup("Gamma");
	four->data = strdup("Delta");
	five->data = strdup("Epsilon");

	one->next = two;
	two->next = three;
	three->next = four;
	four->next = five;
	five->next = NULL;

	*list = one;
	return (list);
}

t_list **generate_3_nodes(void)
{
	t_list **list = malloc(sizeof(t_list *));
	t_list *one = malloc(sizeof(t_list));
	t_list *two = malloc(sizeof(t_list));
	t_list *three = malloc(sizeof(t_list));

	one->data = strdup("1st");
	two->data = strdup("2nd");
	three->data = strdup("3rd");

	one->next = two;
	two->next = three;
	three->next = NULL;

	*list = one;
	return (list);
}

t_list **generate_1_node(void)
{
	t_list **list = malloc(sizeof(t_list *));
	t_list *one = malloc(sizeof(t_list));

	one->data = strdup("I am the only one");
	one->next = NULL;

	*list = one;
	return (list);
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
	printf("%s(Expected): %5d, (Output): %5d\n-- List:\n-- ", status, expected_size, output);
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
	printf("%s(Expected): %5d, (Output): %5d\n-- List:\n-- ", status, expected_size, size_after);
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
	printf("%s(Expected): %5d, (Output): %5d\n-- List:\n-- ", status, expected_size, size_after);
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
	printf("%s(Expected): %5d, (Output): %5d - [%s], [%s]"RESET"\n", status, expected, output, str, base);
}

int main(void)
{
	printf("--- \e[1;36mft_list_size\e[0m ---\n");
	t_list **size = generate_7_nodes();
	test_list_size(*size, 7);
	t_list **size2 = generate_5_nodes();
	test_list_size(*size2, 5);
	t_list **size3 = generate_3_nodes();
	test_list_size(*size3, 3);
	test_list_size(NULL, 0);

	printf("--- \e[1;36mft_list_push_front\e[0m ---\n");
	t_list **push = generate_3_nodes();
	test_list_push_front(*push, strdup("FRONT"), 4);
	t_list **push2 = generate_3_nodes();
	test_list_push_front(*push2, NULL, 3);
	t_list **push3 = malloc(sizeof(t_list *));
	test_list_push_front(*push3, "FRONT", 1);
	test_list_push_front(NULL, NULL, 0);

	printf("--- \e[1;36mft_list_remove_if\e[0m ---\n");
	t_list **remove = generate_7_nodes();
	test_list_remove_if(remove, "aaaa", 4);
	t_list **remove2 = generate_7_nodes();
	test_list_remove_if(remove2, "bbbb", 6);
	t_list **remove3 = generate_7_nodes();
	test_list_remove_if(remove3, NULL, 7);

	printf("--- \e[1;36mft_list_sort\e[0m ---\n");
	t_list **sort = generate_7_nodes();
	test_list_sort(*sort);
	t_list **sort2 = generate_5_nodes();
	test_list_sort(*sort2);
	t_list **sort3 = generate_3_nodes();
	test_list_sort(*sort3);
	t_list **sort4 = generate_1_node();
	test_list_sort(*sort4);
	test_list_sort(NULL);

	printf("--- \e[1;36mft_atoi_base\e[0m ---\n");
	test_atoi_base("1337", "0123456789", 1337);
	test_atoi_base("     1337", "0123456789", 1337);
	test_atoi_base("-1337", "0123456789", -1337);
	test_atoi_base("+1337", "0123456789", 1337);
	test_atoi_base("13w37", "0123456789", 13);
	test_atoi_base("B0B", "0123456789ABCDEF", 2827);
	test_atoi_base("101", "01", 5);
	test_atoi_base("", "0123456789", 0);
	test_atoi_base("1337", "", 0);
	test_atoi_base("", "", 0);
	test_atoi_base("1337", "00123456789", 0);
	test_atoi_base("1337", "-0123456789", 0);
	test_atoi_base("1337", "+0123456789", 0);
	test_atoi_base("1337", " 0123456789", 0);
	test_atoi_base("5", "5", 0);
	return 0;
}
