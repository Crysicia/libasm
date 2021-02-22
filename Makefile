# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lpassera <lpassera@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/18 15:41:20 by lpassera          #+#    #+#              #
#    Updated: 2021/02/22 16:05:38 by lpassera         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		= libasm.a

SRCS		= ft_strlen.s \
			  ft_write.s \
			  ft_read.s \
			  everything.s
OBJS		= $(SRCS:.s=.o)
ASM			= nasm
ASM_FLAGS	= -f elf64
CC			= gcc
CC_FLAGS	= -Wall -Werror -Wextra
LIB_FLAGS	= -L. -lasm
RM			= rm -rf

%.o: %.s
	$(ASM) $(ASM_FLAGS) $< -o $@

all: $(NAME)

$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)

clean:
	$(RM) $(OBJS)

fclean: clean
	$(RM) $(NAME)

test: $(NAME)
	$(CC) $(CC_FLAGS) main.c $(LIB_FLAGS)

re: fclean $(NAME)
