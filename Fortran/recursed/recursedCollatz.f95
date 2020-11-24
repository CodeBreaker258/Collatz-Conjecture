!Colton Steinbeck
!!Collatz Conjecture in Fortran
program collatz
  implicit none

    !!Defining Global Variables
    integer(kind = 8) :: collatzCalc
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
      comp= collatzCalc(n)
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

    call Bubble_Sort(PosArray, StepsArray) !!Orders by magnitude
    do k = 1,10
      print*, PosArray(k), StepsArray(k)
    enddo
   


end program collatz

recursive function collatzCalc(in) result(csteps)    ! functions that computes the collatz sequence length for a given n
    integer(kind=8), intent(in)    :: in   ! the integer to be evaluated
    integer(kind =8):: csteps,i

    i = in
    
    if (i .eq. 1) then  !!If i is ever 1
        csteps = 0
        return
    end if
    if (mod(i, 2) .eq. 1) then    ! if n is odd
        i = 3*i + 1
        csteps = 1 + collatzCalc(i)    !!recursive for 
    else   ! if i is even
        i = i / 2
        csteps = 1 + collatzCalc(i)  ! increment csteps and recur
    end if
end function collatzCalc

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
        b(i)= b(i+1) !
        a(i+1) = temp
        b(i+1) = temp2
        swapped = .TRUE.
      END IF
    END DO
    IF (.NOT. swapped) EXIT
  END DO
END SUBROUTINE Bubble_Sort
