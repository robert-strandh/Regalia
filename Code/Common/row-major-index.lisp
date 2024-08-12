(cl:in-package #:regalia)

(defgeneric array-row-major-index (array &rest subscripts))

(defmethod array-row-major-index (object &rest subscripts)
  (declare (ignore subscripts))
  (error 'argument-to-array-row-major-index-must-be-an-array
         :datum object
         :expected-type 'array))

(defmethod array-row-major-index ((array array) &rest subscripts)
  (let ((dimensions (array-dimensions array)))
    (unless (= (length dimensions) (length subscripts))
      (error 'number-of-subscripts-must-equal-array-rank
             :subscripts subscripts
             :array array))
    (loop for subscript in subscripts
          for dimension in dimensions
          for subscript-number from 0
          for result = subscript then (+ (* result dimension) subscript)
          unless (and (integerp subscript) (>= subscript 0) (< subscript dimension))
            do (error 'subscript-must-be-non-negative-and-less-than-dimension
                      :array array
                      :subscript-number subscript-number)
          finally (return result))))
