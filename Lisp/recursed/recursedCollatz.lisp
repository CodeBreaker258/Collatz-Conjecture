#!/usr/bin/sbcl --script
(defvar csteps 0)
(defvar steps 0)
(defvar comp)
(defvar n)
(defvar i)
(defvar j)
(defvar SArray)

;;Creates an ordered pair that can hold both position and size of the sequence
(defstruct CollatzTuple
	(pos 0)
	(nstep 0)
)
(setf SArray(make-array '(500)))

(defun collatz(pos csteps)
(if(eq pos 1) ;;If the position is 1
    (return from collatz(collatz pos csteps))
    (progn
        (if(eq(mod pos 2) 1)
            (progn
                (setq csteps(+(* 3 pos) 1 )) ;;IF odd
                (setq csteps(+ csteps 1))
                (return-from collatz(collatz pos csteps)) ;;recursive step
            )
        
        (progn ;;else
            (setq csteps(/ pos 2 )) ;;If Even
            (setq csteps(+ csteps 1)) ;;increment
            (return-from collatz(collatz pos csteps)) 
        
        
        
        )
        )
    )
    )
)
;;Loop through 1 to max that makes a tuple for each iteration
(setf i 2)
(loop
	(setf steps (collatz i steps))
	(setf (aref SArray (i)) (make-CollatzTuple :pos i :nstep steps))
	(setf i (+ i 1))
	(when (> i 500) (return))
)
