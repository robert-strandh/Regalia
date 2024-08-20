(cl:in-package #:regalia)

(defun adjustable-array-p (array)
  (unless (arrayp array)
    (error 'type-error
           :datum array
           :expected-type 'array))
  (not (null (underlying-array array))))
