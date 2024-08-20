(cl:in-package #:regalia)

(defun array-displacement (array)
  (unless (arrayp array)
    (error 'type-error
           :datum array
           :exprected-type 'array))
  (let ((displaced-index-offset (displaced-index-offset array)))
    (if (null displaced-index-offset)
        (values nil 0)
        (values (underlying-array array) displaced-index-offset))))
