#!/usr/bin/sbcl --script
(defvar pos)
(defvar nsteps)
(defvar comp)
(defvar csteps 0) ;;Defining the counter for steps as zero
(defvar maxVal) ;;Highest integer 
(setq maxVal 500)
(defvar comp) ;;Integer  
(defvar i)
(defvar n)
;;Creates an ordered pair that can hold both position and NumberSteps of the sequence
(defstruct CollatzTuple
	(pos 0)   ;;Defines the position (magnitude of the number)
	(nstep 0) ;;Sequence value for each magnitude
)



;;Function to calculate collatz
(defun collatz( n csteps ) 
    (loop while (/= n 1) do           ;;While n doesnt eqaul 1
        (if (= (mod n 2) 1)         ;;If odd
            (setq n (+ (* 3 pos) 1))    
            (setq n (/ n 2))          ;;If even
        )
        (setq csteps (+ csteps 1))    ;;Increment csteps
    )
    (return-from collatz csteps) ;;;Returns the number of steps that the sequence works
)
(setf n 8)
(write(collatz csteps))
;;Major Calculation Loop
; (setf i 2)
; (loop
;     (setq csteps (collatz i csteps))
;     (write csteps)
; )