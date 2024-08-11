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
   ;; When this slot contains NIL, then the array is simple.  When the
   ;; array is a displaced array, then this slot contains the arry to
   ;; which this array is displaced.  When the array is a non-simple
   ;; and not displaced, this slot contains a simple array.
   (%underlying-array
    :initform nil
    :initarg :underlying-array
    :accessor underlying-array)))
