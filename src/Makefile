CC = gcc
FC = gfortran
CCFLAGS = -O3 -Wno-unused-result -Wno-implicit-function-declaration
FCFLAGS = -O3
CCLINKER = gcc
FCLINKER = gfortran

all: GeneExtInp ReadExtOut

GeneExtInp: GeneExtInp.o
	@echo "\033[40;35m Linking $@ ... \033[0m"
	$(CCLINKER) -o $@ $^

ReadExtOut: ReadExtOut.o ReadExtGCPGrad.o WriteExtOut.o
	@echo "\033[40;35m Linking $@ ... \033[0m"
	$(FCLINKER) -o $@ $^

GeneExtInp.o: GeneExtInp.c
	@echo "\033[40;35m Compiling $@ ... \033[0m"
	$(CC) $(CCFLAGS) -o $@ -c $^

ReadExtOut.o: ReadExtOut.c
	@echo "\033[40;35m Compiling $@ ... \033[0m"
	$(CC) $(CCFLAGS) -o $@ -c $^

ReadExtGCPGrad.o: ReadExtGCPGrad.f90
	@echo "\033[40;35m Compiling $@ ... \033[0m"
	$(FC) $(FCFLAGS) -o $@ -c $^

WriteExtOut.o: WriteExtOut.f90
	@echo "\033[40;35m Compiling $@ ... \033[0m"
	$(FC) $(FCFLAGS) -o $@ -c $^

.PHONY: clean
clean:
	-rm -f GeneExtInp ReadExtOut
	-rm -f *.o 

	
