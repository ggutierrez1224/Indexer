CC = gcc
CFLAGS = -Wall -Werror -g

all: index 

index: indexer.o sorted-list.o tokenizer.o main.o libsl.a
	$(CC) $(CFLAGS) -o index $^

main.o: main.c
	$(CC) $(CFLAGS) -c $^

indexer.o: indexer.c tokenizer.c sorted-list.c
	$(CC) $(CFLAGS) -c $^

tokenizer.o: tokenizer.c
	$(CC) $(CFLAGS) -c $^

libsl.a:	sorted-list.o
	ar rv libsl.a sorted-list.o

sorted-list.o: 	sorted-list.c
	$(CC) $(CFLAGS) -c sorted-list.c	


clean:
	rm -f index
	rm -f *o
	rm -f libsl.a
