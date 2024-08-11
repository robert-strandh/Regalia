(cl:in-package #:regalia)

(defgeneric aref (array &rest subscripts))

(defmethod aref (array &rest subscripts)
  (declare (ignore subscripts))
  (error 'type-error :datum array :expected-type 'array))

(defmethod aref ((array array) &rest subscripts)
  (cond ((array-is-simple-p array)
         (let ((row-major-index
                 (apply #'array-row-major-index array subscripts)))
           (row-major-aref-unchecked array row-major-index)))
        ((array-is-displaced-p array)
         (let ((row-major-index
                 (apply #'array-row-major-index array subscripts)))
           (row-major-aref array row-major-index)))
        (t
         (apply #'aref (underlying-array array) subscripts))))

(defgeneric (setf aref) (new-element array &rest subscripts))
