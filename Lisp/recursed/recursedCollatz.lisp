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

(defun collatz(n csteps)
    (loop while (/= n 1) do           ; If n is not equal to 1
        (if (= (mod n 2) 1)         
            (setq n (+ (* 3 n) 1))    ; If off
            (setq n (/ n 2))          ;If even
        )
        (setq csteps (+ csteps 1))    ;Incrments 
    )
    (return-from collatz csteps)
)

(setf i 2)
(loop
	(setf steps (collatz i steps))
	(setf (aref StepArray (i)) (make-CollatzTuple :pos i :NumberSteps steps))
	(setf i (+ i 1))
	(when (> i 10) (return))
)
