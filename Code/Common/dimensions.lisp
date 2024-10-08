(cl:in-package #:regalia)

;;; This method is applicable when ARRAY-DIMENSIONS is given an object
;;; that is not an array.  The standard requires us to signal a type
;;; error then.
(defmethod array-dimensions (array)
  (error 'type-error :datum array :expected-type 'array))

(defmethod array-dimensions :around ((array array))
  (if (or (array-is-simple-p array)
          (array-is-displaced-p array))
      (call-next-method)
      (array-dimensions (underlying-array array))))

(defun array-dimension (array axis-number)
  (let ((dimensions (array-dimensions array)))
    (if (or (minusp axis-number)
            (>= axis-number (length dimensions)))
        (error 'invalid-axis-number
               :datum axis-number
               :expected-type `(integer 0 ,(1- (length dimensions))))
        (nth axis-number dimensions))))

(defun array-rank (array)
  (length (array-dimensions array)))
