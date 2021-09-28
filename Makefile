all: hello 

hello: hello1 hello2

hello1: hello_func.o
	gcc -shared -o libbasic.so hello_func.o

hello_func.o: hello_func.c
	gcc -fPIC -c hello_func.c

hello2: main.o
	gcc -o main main.o libbasic.so
	export LD_LIBRARY_PATH=:/home/yuvaraja/Desktop/example
	gcc main.o hello_func.o -o hello
	
main.o: main.c
	gcc -c main.c
	
clean: 
	rm -rf *o hello

