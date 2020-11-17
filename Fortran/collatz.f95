!Colton Steinbeck
!!Collatz Conjecture in Fortran
program collatz
implicit none
    ! !Creation of the storage for holding the position
    type tuple              
        integer(kind=8)    :: position, steps
    end type tuple

    !!Defining Global Variables
    integer(kind = 8) :: collatz_calculation
    type (tuple) :: tuple1
    type (tuple), dimension(10):: collatztuple
    integer(kind=8):: n, End= 5e9, j
    

    !!Iterative Loop
    
    do n = 1,End
    tuple1%position = n                        !links the position in (position, steps) to the n value
    tuple1%steps = collatz_calculation(n)      !! Links the steps in (position, steps) as the # of steps when calculated for the collatz sequence
    if(tuple1%steps .gt. collatztuple%steps)then !!Compare tuple to one in the final

    endif
    if()then
    
    endif

    enddo

    !!Bubblesort Algorithm


end program collatz

function collatz_calculation(in) result(csteps)
    implicit none
    integer(kind = 8), intent(in) :: in
    integer(kind = 8) :: csteps, i
    i =in !! Sets the input as the i value
    if(i .eq. 1) then 
        csteps = 0
    endif
do while ( i /= 1 )  
   if ( mod(i,2) == 0 ) then  ! If even divide by 2
     i = i / 2
   else
     i = (i * 3 + 1)/2            ! If odd multiply by 3 and add 1
     csteps = csteps + 1
   endif
   csteps =csteps + 1                ! Increment counter
enddo
end function collatz_calculation
