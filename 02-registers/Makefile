all: sum

sum: sum.o
	gcc -o $@ $+

sum.o: sum01.s
	as -o $@ $<

clean:
	rm -vf sum *.o
