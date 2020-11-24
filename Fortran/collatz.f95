!Colton Steinbeck
!!Collatz Conjecture in Fortran
program collatz
  implicit none

    !!Defining Global Variables
    integer(kind = 8) :: collatz_calculation
    integer(8), dimension(10):: PosArray, StepsArray
    integer(kind=8):: n, max = 5e9, comp, k, m
    
    interface
      SUBROUTINE Bubble_Sort(a,b) 
      integer(8), INTENT(in out), DIMENSION(:) :: a, b
      integer(8) :: temp, temp2
      INTEGER(8) :: i, j
      LOGICAL :: swapped
      end SUBROUTINE
    end interface

    !!Zeroing out the arrays
    PosArray = (/ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 /)
     StepsArray= (/ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 /)



    !!Storing Loop of values and sequences in Arrays
    do n = 1, max
      comp= collatz_calculation(n)
      if(comp .gt. StepsArray(1)) then
          PosArray(1)= n
          StepsArray(1) =comp
        endif
      call Bubble_Sort(StepsArray, PosArray)

    !print*, StepsArray
    !print*, PosArray
    enddo
    !!Sorting process
    do k = 1,10
      print*, PosArray(k), StepsArray(k)
    enddo


    !!Prints order of bubblesort
    call Bubble_Sort(PosArray, StepsArray) !!Orders by magnitude
    do k = 1,10
      print*, PosArray(k), StepsArray(k)
    enddo
   


end program collatz

function collatz_calculation(in) result(csteps)
    implicit none
    integer(kind = 8), intent(in) :: in
    integer(kind = 8) :: csteps, i
    i =in !! Sets the input as the i value
    csteps = 0 !!Sets the number of sets right out as zero since 1 is the first value
  do while ( i /= 1 )  
    if ( mod(i,2) == 1 ) then   ! If odd multiply by 3 and add 1
        i = (i * 3 + 1)/2
        csteps = csteps + 1
    else
        i = i / 2
    endif
    csteps =csteps + 1                ! Increment counter
  enddo
end function collatz_calculation

SUBROUTINE Bubble_Sort(a,b) 
  integer(8), INTENT(in out), DIMENSION(:) :: a, b
  integer(8) :: temp, temp2
  INTEGER(8) :: i, j
  LOGICAL :: swapped
 
  DO j = SIZE(a)-1, 1, -1
    swapped = .FALSE.
    DO i = 1, j
      IF (a(i) > a(i+1)) THEN
        temp = a(i)
        temp2 = b(i)
        a(i) = a(i+1)
        b(i)= b(i+1)
        a(i+1) = temp
        b(i+1) = temp2
        swapped = .TRUE.
      END IF
    END DO
    IF (.NOT. swapped) EXIT
  END DO
END SUBROUTINE Bubble_Sort
