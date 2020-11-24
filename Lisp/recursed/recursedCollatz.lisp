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
(setf StepArray(make-array '(500)))

(defun collatz(pos csteps)
(if(eq pos 1) ;;If the position is 1
    (return from collatz(collatz pos csteps))
    (progn
        (if(eq(mod pos 2) 1)
            (progn
                (setq csteps(+(* 3 pos) 1 ))
                (setq csteps(+ csteps 1))
                (return-from collatz(collatz pos csteps))
            )
        
        (progn ;;else
            (setq csteps(/ pos 2 ))
            (setq csteps(+ csteps 1))
            (return-from collatz(collatz pos csteps))
        
        
        
        )
        )
    )
    )
)

(setf i 2)
(loop
	(setf steps (collatz i steps))
	(setf (aref StepArray (i)) (make-CollatzTuple :pos i :NumberSteps steps))
	(setf i (+ i 1))
	(when (> i 500) (return))
)
