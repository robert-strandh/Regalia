(cl:in-package #:regalia)

;;; This generic function is a reader for a slot containing the list
;;; of dimensions.
(defgeneric array-dimensions (array))

(defgeneric underlying-array (array))

(defgeneric (setf underlying-array) (underlying-array array))

(defgeneric displaced-index-offset (array))

(defgeneric (setf displaced-index-offset) (offset array))

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
    :accessor underlying-array)
   ;; When the array is a displaced array, this slot contains a
   ;; non-negative integer.  Otherwise, this slot contains NIL.
   (%displaced-index-offset
    :initform nil
    :initarg :displaced-index-offset
    :accessor displaced-index-offset)))

(setf (documentation 'array-dimensions 'function)
      (format nil
              "Syntax: array-dimensions array~@
               ~@
               This function returns a list of non-negative integers.~@
               The list may be empty if the array has rank 0.  If~@
               ARRAY is a vector with a fill pointer, the fill pointer~@
               is ignored.~@
               ~@
               If ARRAY is not an object of type ARRAY, then an error~@
               of type TYPE-ERROR is signaled."))
