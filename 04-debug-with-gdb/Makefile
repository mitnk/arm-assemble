all: store

store: store.o
	gcc -o $@ $+

store.o: store01.s
	as -o $@ $<

clean:
	rm -vf store *.o
