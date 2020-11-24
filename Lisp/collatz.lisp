#!/usr/bin/sbcl --script
(defvar newNum)
(defvar CStepArray)
(defvar size)
(defvar csteps 0)
(defvar steps 0)
(defvar maxVal)
(defvar comp)
(defvar n)
(defvar i)
(defvar j)
(defvar StepArray)

;;Creates an ordered pair that can hold both position and size of the sequence
(defstruct CollatzTuple
	(pos 0)
	(NumberSteps 0)
)
(setf StepArray(make-array 10))

(defun collatz(n csteps) ;;Function to calculate collatz
    (loop while (/= n 1) do           ;;While n doesnt eqaul 1
        (if (= (mod n 2) 1)         ;;If odd
            (setq n (+ (* 3 n) 1))    
            (setq n (/ n 2))          ;;If even
        )
        (setq csteps (+ csteps 1))    ;;Increment csteps
    )
    (return-from collatz csteps) ;;;Returns the number of steps that the sequence works
)



(setf i 2)
(loop
	(setf steps (collatz i steps)) ;;Steps that it takes to reach the collatz sequence
	(setf (aref StepArray (i)) (make-CollatzTuple :pos i :NumberSteps steps)) ;; Steps the position and steps of the tuple to what the c
	(setf i (+ i 1)) ;;Increments i
	(when (> i 10) (return)) ;; While the value is less than 10
)

(set i 1) ;; Going to loop from thye