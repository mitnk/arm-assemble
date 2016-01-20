all: collatz

collatz: collatz.o
	gcc -o $@ $+

collatz.o: collatz.s
	as -o $@ $<

clean:
	rm -vf collatz *.o
