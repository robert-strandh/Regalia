(cl:in-package #:regalia)

(defun adjustable-array-p (array)
  (unless (arrayp array)
    (error 'type-error
           :datum array
           :expected-type 'array))
  (not (null (underlying-array array))))

(setf (documentation 'adjustable-array-p 'function)
      (format nil
              "Syntax: adjustable-array-p array~@
               ~@
               This function returns T if ARRAY is an actually adjustable~@
               array.  It returns NIL if ARRAY is an array that is not~@
               actually adjustable.~@
               ~@
               An error of type TYPE-ERROR is signaled if ARRAY is an~@
               object other than an array."))

