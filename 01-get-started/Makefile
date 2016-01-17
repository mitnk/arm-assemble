all: first

first: first.o
	gcc -o $@ $+

first.o: first-program.s
	as -o $@ $<

clean:
	rm -vf first *.o
