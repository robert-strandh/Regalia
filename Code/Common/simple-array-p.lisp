(cl:in-package #:regalia)

(defgeneric simple-array-p (object))

(defmethod simple-array-p (object)
  nil)

(defmethod simple-array-p ((object array))
  (null (underlying-array object)))

(deftype simple-array ()
  `(and array (satisfies simple-array-p)))
