#!/usr/bin/sbcl --script
(defvar pos)
(defvar nsteps)
(defvar comp)
(defvar csteps 0) ;;Defining the counter for steps as zero
(defvar maxVal) ;;Highest integer 
(setq maxVal 10)
(defvar comp) ;;Integer  
(defvar i)
;;Creates an ordered pair that can hold both position and NumberSteps of the sequence
(defstruct CollatzTuple
	(pos 0)   ;;Defines the position (magnitude of the number)
	(nstep 0) ;;Sequence value for each magnitude
)

;;Creation of the array
;;(setq SArray (make-array '(50)))

;;Function to calculate collatz
(defun collatz( pos csteps ) 
    (loop while (/= pos 1) do           ;;While n doesnt eqaul 1
        (if (= (mod pos 2) 1)         ;;If odd
            (setq pos (+ (* 3 pos) 1))    
            (setq pos (/ pos 2))          ;;If even
        )
        (setq csteps (+ csteps 1))    ;;Increment csteps
    )
    (return-from collatz csteps) ;;;Returns the number of steps that the sequence works
)

(setf i 2)
(loop
	(setf csteps (collatz i csteps))
    (write i)
     
	(write csteps)
    (princ "   ")
	(setf i (+ i 1))
	(when (> i 50) (return))
)