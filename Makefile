# Compiler and flags
FC = gfortran
FCFLAGS = -O2 -Wall -Wno-character-truncation


# Source files
SRC = complex_calculator.f90 user_interface.f90

# Output executable
OUT = complex_calculator

# Default target to build the program
all: $(OUT)

# Rule to build the program
$(OUT): $(SRC)
	$(FC) $(FCFLAGS) -o $(OUT) $(SRC)

# Rule to run the program
run: $(OUT)
	./$(OUT)

# Clean up the compiled files
clean:
	rm -f $(OUT) *.o
