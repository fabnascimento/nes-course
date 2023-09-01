all:
	ca65 .\exercises\ex1.asm -o ex1.o
	ld65 ex1.o -o ex1.nes -C nes.cfg

	ca65 .\exercises\ex2.asm -o ex2.o
	ld65 ex2.o -o ex2.nes -C nes.cfg

	ca65 .\exercises\ex3.asm -o ex3.o
	ld65 ex3.o -o ex3.nes -C nes.cfg

	ca65 .\exercises\ex4.asm -o ex4.o
	ld65 ex4.o -o ex4.nes -C nes.cfg

	ca65 .\exercises\ex5.asm -o ex5.o
	ld65 ex5.o -o ex5.nes -C nes.cfg

	ca65 .\exercises\ex6.asm -o ex6.o
	ld65 ex6.o -o ex6.nes -C nes.cfg

	ca65 .\exercises\ex7.asm -o ex7.o
	ld65 ex7.o -o ex7.nes -C nes.cfg

	ca65 .\exercises\ex8.asm -o ex8.o
	ld65 ex8.o -o ex8.nes -C nes.cfg

	ca65 .\exercises\ex9.asm -o ex9.o
	ld65 ex9.o -o ex9.nes -C nes.cfg
