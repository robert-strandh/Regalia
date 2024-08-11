(cl:in-package #:regalia)

;;; This generic function is a reader for a slot containing the list
;;; of dimensions.
(defgeneric array-dimensions (array))

(defgeneric underlying-array (array))

;;; ARRAY is a standard class, so STANDARD-OBJECT will automatically
;;; be included as a superclass.
(defclass array ()
  ((%dimensions
    :initarg :dimensions
    :reader array-dimensions)
   (%underlying-array
    :initform nil
    :initarg :underlying-array
    :accessor underlying-array)))
