
all:	x 

x:	main.o dot_prod.o mod.o matrix_prod.o
	gcc -o x main.o dot_prod.o mod.o matrix_prod.o

main.o:	main.s
	gcc -c main.s

main.s:	main.c
	gcc -O2 -S main.c

dot_prod.o:	dot_prod.s
	gcc -g -c dot_prod.s

matrix_prod.o:	matrix_prod.s
	gcc -g -c matrix_prod.s

mod.o:	mod.s
	gcc -g -c mod.s

clean:	
	rm -f x *.o main.s
