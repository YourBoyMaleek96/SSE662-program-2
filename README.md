# Module 2 Programming Task

## Overview
This Fortran program implements a command-line user interface (UI) that performs various operations on complex numbers. The program allows users to:
- Add, subtract, multiply, and divide complex numbers
- Raise a complex number to an integer power
- Compute the complex conjugate of a complex number
- Display the results in multiple formats:
  - (real, imag)
  - real+imag*i
  - real (if the complex number has no imaginary part)

The program also includes input validation to ensure that complex numbers are entered correctly and provides error handling for invalid inputs.

## Features
- **Add**: Add two complex numbers
- **Subtract**: Subtract one complex number from another
- **Multiply**: Multiply two complex numbers
- **Divide**: Divide one complex number by another
- **Power**: Raise a complex number to a specified integer power
- **Conjugate**: Compute the complex conjugate of a complex number
- **Result Display**: Option to display the result in various formats:
  - `(real, imag)`
  - `real+imag*i`
  - `real` (for real numbers)
- **Input Validation**: Ensures complex numbers are entered correctly and handles invalid inputs gracefully

## Requirements
- **Fortran Compiler**
- **Visual Studio Code with the FORTRAN extension**

## How to Run the Program

1. **Install Fortran Compiler**:
   - If you don't have GFortran installed, you can install it from [here](https://gcc.gnu.org/wiki/GFortranBinaries).
   
2. **Clone or Download the Repository**:
   -- Clone or download the project repository from the following URL: [Project Repository URL](https://github.com/YourBoyMaleek96/SSE662-program-2).

3. **Navigate to the Project Directory**:
   - Open a terminal (or command prompt) and navigate to the directory where the Fortran files (`complex_module.f90`, `user_interface.f90`) are located.

4. **Compile the Program**:
   - To compile the Fortran program, run the following command:

     ```bash
     gfortran -o complex_calculator complex_module.f90 user_interface.f90
     ```

5. **Run the Program**:
   - After successful compilation, you can run the program by executing the following command in your terminal or command prompt:
   
     On **Linux/macOS**:

     ```bash
     ./complex_calculator
     ```

     On **Windows** :

     ```bash
     complex_calculator.exe
     ```

6. **Interact with the Program**:
   - The program will prompt you to select an operation (e.g., add, subtract, multiply, divide, power, conjugate).
   - Enter the desired operation and follow the prompts to input the complex numbers.

7. **Exit the Program**:
   - After each calculation, the program will ask if you want to perform another calculation. Type `yes` to continue or `no` to exit the program.

---

## Example Usage and Input Details

Here’s what you will need to input in the command line for each operation:

 **1. Add**: Add two complex numbers

```bash
Select an operation: add, subtract, multiply, divide, power, conjugate
add
Enter the first complex number:
Formats: (real,imag), real+imag*i, or real
2+3i
Enter the second complex number:
Formats: (real,imag), real+imag*i, or real
4-5i
 Select output format:
  1. (real, imag)
  2. real+imag*i
  3. real (display only the real part)
```

 **2. Subtract**: subtract two complex numbers

 ```bash
Select an operation: add, subtract, multiply, divide, power, conjugate
subtract
Enter the first complex number:
Formats: (real,imag), real+imag*i, or real
5+4i
Enter the second complex number:
Formats: (real,imag), real+imag*i, or real
3+2i
 Select output format:
  1. (real, imag)
  2. real+imag*i
  3. real (display only the real part)
```

 **3. Multiply**: Multiply two complex numbers
 ```bash
Select an operation: add, subtract, multiply, divide, power, conjugate
multiply
Enter the first complex number:
Formats: (real,imag), real+imag*i, or real
1+2i
Enter the second complex number:
Formats: (real,imag), real+imag*i, or real
3-4i
 Select output format:
  1. (real, imag)
  2. real+imag*i
  3. real (display only the real part)
```

 **4. Divide**: Divide two complex numbers
```bash
Select an operation: add, subtract, multiply, divide, power, conjugate
divide
Enter the first complex number:
Formats: (real,imag), real+imag*i, or real
2+3i
Enter the second complex number:
Formats: (real,imag), real+imag*i, or real
1-1i
 Select output format:
  1. (real, imag)
  2. real+imag*i
  3. real (display only the real part)
```

 **5. Power**: Raise a complex number to a power 
```bash
Select an operation: add, subtract, multiply, divide, power, conjugate
power
Enter the complex number:
Formats: (real,imag), real+imag*i, or real
1+1i
Enter an integer power:
2
 Select output format:
  1. (real, imag)
  2. real+imag*i
  3. real (display only the real part)
```
 
 **6. Conjugate**: Find complex conjugate  
```bash
Select an operation: add, subtract, multiply, divide, power, conjugate
conjugate
Enter the complex number:
Formats: (real,imag), real+imag*i, or real
3+4i
 Select output format:
  1. (real, imag)
  2. real+imag*i
  3. real (display only the real part)
```

