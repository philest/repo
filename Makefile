CC=gcc
CFLAGS= -std=c99 -g -Wall -pedantic

all: clean lzw
	ln lzw encode
	ln lzw decode
clean: 
	$(RM) lzw.o hash.o code.o code1.o code2.o code.o stack.o lzw encode decode

lzw: lzw.o hash.o stack.o code2.o
	$(CC) $(CFLAGS) -o $@ $^

lzw.o: lzw.c lzw.h hash.h
	$(CC) $(CFLAGS) -c $<

hash.o: hash.c hash.h
	$(CC) $(CFLAGS) -c $<

stack.o: stack.c stack.h
	$(CC) $(CFLAGS) -c $<

code2.o: code2.c code.h
	$(CC) $(CFLAGS) -c code2.c



