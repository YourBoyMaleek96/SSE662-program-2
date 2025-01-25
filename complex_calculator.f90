module complex_module
    implicit none
  
    ! Defining the complex number data type
    type :: complex_number
        real(kind=8) :: real, imag
    end type complex_number
  
  contains
  
    ! Function to add two complex numbers
    function add(a, b) result(c)
        type(complex_number), intent(in) :: a, b
        type(complex_number) :: c
        c%real = a%real + b%real
        c%imag = a%imag + b%imag
    end function add
  
    ! Function to subtract two complex numbers
    function subtract(a, b) result(c)
        type(complex_number), intent(in) :: a, b
        type(complex_number) :: c
        c%real = a%real - b%real
        c%imag = a%imag - b%imag
    end function subtract
  
    ! Function to multiply two complex numbers
    function multiply(a, b) result(c)
        type(complex_number), intent(in) :: a, b
        type(complex_number) :: c
        c%real = a%real * b%real - a%imag * b%imag
        c%imag = a%real * b%imag + a%imag * b%real
    end function multiply
  
    ! Function to divide two complex numbers
    function divide(a, b) result(c)
        type(complex_number), intent(in) :: a, b
        type(complex_number) :: c
        real(kind=8) :: denominator
        denominator = b%real**2 + b%imag**2
        if (denominator == 0.0) then
            print *, 'Error: Division by zero.'
            c%real = 0.0
            c%imag = 0.0
        else
            c%real = (a%real * b%real + a%imag * b%imag) / denominator
            c%imag = (a%imag * b%real - a%real * b%imag) / denominator
        end if
    end function divide
  
    ! Function to raise a complex number to the power of an integer
    function power(a, n) result(c)
        type(complex_number), intent(in) :: a
        integer, intent(in) :: n
        type(complex_number) :: c
        integer :: i
  
        c%real = 1.0
        c%imag = 0.0
        if (n == 0) return  ! Anything to the power of 0 is 1
  
        c = a
        do i = 2, n
            c = multiply(c, a)
        end do
    end function power
  
    ! Function to compute the complex conjugate
    function conjugate(a) result(c)
        type(complex_number), intent(in) :: a
        type(complex_number) :: c
        c%real = a%real
        c%imag = -a%imag
    end function conjugate
  
  end module complex_module
  