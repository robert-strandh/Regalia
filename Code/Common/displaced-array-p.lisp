(cl:in-package #:regalia)

(cl:in-package #:regalia)

(defun array-is-displaced-p (array)
  (not (null (displaced-index-offset array))))

(defgeneric displaced-array-p (object))

(defmethod displaced-array-p (object)
  nil)

(defmethod displaced-array-p ((object array))
  (array-is-displaced-p object))

(deftype displaced-array ()
  `(and array (satisfies displaced-array-p)))
