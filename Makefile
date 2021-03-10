# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lpassera <lpassera@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/18 15:41:20 by lpassera          #+#    #+#              #
#    Updated: 2021/03/10 23:50:19 by lpassera         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		= libasm.a
SRCS		= ft_strlen.s \
			  ft_write.s \
			  ft_read.s \
			  ft_strcpy.s \
			  ft_strcmp.s \
			  ft_strdup.s
OBJS		= $(SRCS:.s=.o)
SRCS_BONUS	= ft_atoi_base.s \
			  ft_list_size.s \
			  ft_list_push_front.s \
			  ft_list_remove_if.s \
			  ft_list_sort.s
OBJS_BONUS	= $(SRCS_BONUS:.s=.o)
AR			= ar rcs
ASM			= nasm
ASM_FLAGS	= -f elf64
CC			= gcc
CC_FLAGS	= -Wall -Werror -Wextra
LIB_FLAGS	= -L. -lasm
RM			= rm -rf
TEST		= test
TEST_BONUS	= test_bonus

%.o: %.s
	$(ASM) $(ASM_FLAGS) $< -o $@

all: $(NAME)

$(NAME): $(OBJS)
	$(AR) $(NAME) $(OBJS)

bonus: $(NAME) $(OBJS_BONUS)
	$(AR) $(NAME) $(OBJS_BONUS)

clean:
	$(RM) $(OBJS)
	$(RM) $(OBJS_BONUS)

fclean: clean
	$(RM) $(NAME)

test: $(NAME)
	$(CC) $(CC_FLAGS) main.c $(LIB_FLAGS) -o $(TEST)

test_bonus: bonus
	$(CC) $(CC_FLAGS) main_bonus.c $(LIB_FLAGS) -o $(TEST_BONUS)

clean_test:
	$(RM) $(TEST) $(TEST_BONUS)

re: fclean $(NAME)
