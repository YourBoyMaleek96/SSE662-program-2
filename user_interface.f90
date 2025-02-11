!*************************************************************************************************************************
! Name: Malik Freeman
! Date: 2/2/2025
! Course: SSE 662 - Design, Maintenance, and Quality
! Assignment: Module 2 Programming Task
! File Name: user_interface.f90
! Description: This file implements a command-line user interface (UI) for performing operations on complex numbers.
!              The UI is centered around the command line and allows users to perform the following operations:
!              - Add: Add two complex numbers
!              - Subtract: Subtract one complex number from another
!              - Multiply: Multiply two complex numbers
!              - Divide: Divide one complex number by another
!              - Power: Raise a complex number to an integer power
!              - Conjugate: Compute the complex conjugate of a complex number
!              - Display results in different formats:
!                - (real, imag)
!                - real+imag*i
!                - real (if the number has no imaginary part)
!              - Input validation and error handling for invalid complex number formats
!              - Option to continue or exit after performing calculations
!*************************************************************************************************************************


program user_interface
  use complex_module
  implicit none
  type(complex_number) :: num1, num2, result
  character(len=100) :: input1
  character(len=20) :: operation
  integer :: n
  logical :: continue_program

  continue_program = .true.

  do while (continue_program)

      ! Prompt the user to select an operation
      print *, 'Select an operation: add, subtract, multiply, divide, power, conjugate'
      read(*, '(A)') operation

      select case (trim(adjustl(operation)))
      case ('add', 'subtract', 'multiply', 'divide')

          ! Input for the first complex number
          call prompt_and_parse('Enter the first complex number:', num1)

          ! Input for the second complex number
          call prompt_and_parse('Enter the second complex number:', num2)

          select case (trim(adjustl(operation)))
          case ('add')
              result = add(num1, num2)
          case ('subtract')
              result = subtract(num1, num2)
          case ('multiply')
              result = multiply(num1, num2)
          case ('divide')
              result = divide(num1, num2)
          end select

      case ('power')
          ! Input for the complex number
          call prompt_and_parse('Enter the complex number:', num1)

          print *, 'Enter an integer power:'
          read(*, *) n
          result = power(num1, n)

      case ('conjugate')
          ! Input for the complex number
          call prompt_and_parse('Enter the complex number:', num1)
          result = conjugate(num1)

      case default
          print *, 'Invalid operation. Supported operations are: add, subtract, multiply, divide, power, conjugate.'
          cycle
      end select

      ! Display the result
      call display_result(result)

      ! Ask the user if they want to continue
      print *, 'Do you want to perform another calculation? (yes/no)'
      read(*, '(A)') operation
      if (trim(adjustl(operation)) /= 'yes' .and. trim(adjustl(operation)) /= 'YES') continue_program = .false.

  end do

contains

  ! Subroutine to prompt and parse complex numbers
  subroutine prompt_and_parse(prompt, num)
      character(len=*), intent(in) :: prompt
      type(complex_number), intent(out) :: num
      character(len=100) :: input
      logical :: is_valid

      is_valid = .false.
      do while (.not. is_valid)
          print *, prompt
          print *, 'Formats: (real,imag), real+imag*i, or real'
          read(*, '(A)') input
          call parse_complex(input, num, is_valid)

          if (.not. is_valid) then
              print *, 'Invalid input format. Please try again.'
          end if
      end do
  end subroutine prompt_and_parse

  ! Subroutine to parse the complex number input
  subroutine parse_complex(input, num, is_valid)
      character(len=*), intent(in) :: input
      type(complex_number), intent(out) :: num
      logical, intent(out) :: is_valid
      integer :: pos
      character(len=100) :: real_part, imag_part

      ! Initialize the complex number and validity
      num%real = 0.0
      num%imag = 0.0
      is_valid = .true.

      if (index(input, 'i') > 0) then
          pos = index(input, 'i')
          if (index(input, '+') > 0) then
              real_part = trim(input(1:index(input, '+')-1))
              imag_part = trim(input(index(input, '+')+1:pos-1))
          else if (index(input, '-') > 0 .and. index(input, '-') > 1) then
              real_part = trim(input(1:index(input, '-')-1))
              imag_part = trim(input(index(input, '-')+1:pos-1))
              imag_part = '-' // imag_part  ! Add back the negative sign
          else
              is_valid = .false.
              return
          endif

          ! Validate real and imaginary parts
          call validate_real(real_part, is_valid)
          if (.not. is_valid) return
          call validate_real(imag_part, is_valid)
          if (.not. is_valid) return

          read(real_part, *) num%real
          read(imag_part, *) num%imag

      else
          real_part = trim(input)
          call validate_real(real_part, is_valid)
          if (.not. is_valid) return
          read(real_part, *) num%real
      end if
  end subroutine parse_complex

  ! Subroutine to validate a string as a real number
  subroutine validate_real(value, is_valid)
      character(len=*), intent(in) :: value
      logical, intent(out) :: is_valid
      real(kind=8) :: temp
      integer :: iostat_value

      ! Attempt to read the value into a temporary variable
      read(value, *, iostat=iostat_value) temp

      ! Check the IOSTAT value to determine if the input is valid
      is_valid = (iostat_value == 0)
  end subroutine validate_real

  ! Subroutine to display the result in various formats
  subroutine display_result(result)
    type(complex_number), intent(in) :: result
    integer :: choice

    print *, 'Select output format:'
    print *, ' 1. (real, imag)'
    print *, ' 2. real+imag*i'
    print *, ' 3. real (display only the real part)'
    read(*, *) choice

    select case (choice)
    case (1)
        print *, 'Result: (', result%real, ',', result%imag, ')'
    case (2)
        if (result%imag >= 0) then
            print *, 'Result: ', result%real, '+', result%imag, '*i'
        else
            print *, 'Result: ', result%real, result%imag, '*i'
        endif
    case (3)
        print *, 'Result (real part): ', result%real
    case default
        print *, 'Invalid format selection.'
    end select
end subroutine display_result

end program user_interface
