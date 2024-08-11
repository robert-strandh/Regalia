(cl:in-package #:regalia)

;;; This generic function is a reader for a slot containing the list
;;; of dimensions.
(defgeneric array-dimensions (array))

;;; ARRAY is a standard class, so STANDARD-OBJECT will automatically
;;; be included as a superclass.
(defclass array ()
  ((%dimensions :initarg :dimensions :reader array-dimensions)))
