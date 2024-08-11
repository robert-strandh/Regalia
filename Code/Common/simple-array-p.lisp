(cl:in-package #:regalia)

(defun array-is-simple-p (array)
  (null (underlying-array object)))

(defgeneric simple-array-p (object))

(defmethod simple-array-p (object)
  nil)

(defmethod simple-array-p ((object array))
  (array-is-simple-p object))

(deftype simple-array ()
  `(and array (satisfies simple-array-p)))
