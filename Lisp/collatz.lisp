#!/usr/bin/sbcl --script
(defvar pos)
(defvar nsteps)
(defvar comp)
(defvar csteps) ;;Defining the counter for steps as zero
(setf csteps 0)
(defvar comp) ;;Calculation of the Collatz Sequence for i
(defvar i) ;;Iterator value
(defvar SArray) ;;Array to create all the values

;;Creates an ordered pair that can hold both position and NumberSteps of the sequence
(defstruct CollatzTuple
	(pos 0)   ;;Defines the position (magnitude of the number)
	(nsteps 0) ;;Sequence value for each magnitude
)

;;Creation of the array
(setq SArray (make-array '(500)))

;;Function to calculate collatz
(defun collatz( pos csteps )
    (setf csteps 0) ;;Resets loop so that the steps counts dont bleed over
    (loop while (/= pos 1) do           ;;While position is not 1
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
	(setf csteps (collatz i csteps)) ;;Calcualting the steps for the instance of i
    (make-CollatzTuple :pos i :nsteps csteps) ;;Creates the Collatz Tuple to hold pos and # of steps
    (setf SArray (make-CollatzTuple :pos i :nsteps csteps)) ;;Sets it to the array
    (print SArray)
	(setf i (+ i 1)) ;;Incrementing the counter
	(when (> i 500) (return)) ;; When i is greater than the maxVal
)




)
