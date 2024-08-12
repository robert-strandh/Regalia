(cl:in-package #:regalia)

(defun array-in-bounds-p (array &rest subscripts)
  (let ((dimensions (array-dimensions array)))
    (unless (= (length dimensions) (length subscripts))
      (error 'number-of-subscripts-must-equal-array-rank
             :subscripts subscripts
             :array array))
    (loop for subscript in subscripts
          for dimension in dimensions
          for subscript-number from 0
          always (and (integerp subscript) (< -1 subscript dimension)))))
