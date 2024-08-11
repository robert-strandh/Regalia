(cl:in-package #:regalia)

;;; In the extrinsic version of the class ARRAY, we add a slot that
;;; contains a host vector for the contents.

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
    :accessor displaced-index-offset)
   (%contents
    :initarg :contents
    :reader contentas)))
