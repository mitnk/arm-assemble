all: compare

compare: compare.o
	gcc -o $@ $+

compare.o: compare01.s
	as -o $@ $<

clean:
	rm -vf compare *.o
