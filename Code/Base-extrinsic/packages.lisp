(cl:in-package #:common-lisp-user)

(defpackage #:regalia
  (:use #:common-lisp)
  (:shadow
   . #1=(#:array
         #:simple-array
         #:vector
         #:simple-vector
         #:bit-vector
         #:simple-bit-vector
         #:make-array
         #:adjust-array
         #:adjustable-array-p
         #:aref
         #:array-dimension
         #:array-dimensions
         #:array-element-type
         #:array-has-fill-pointer-p
         #:array-displacement
         #:array-in-bounds-p
         #:array-rank
         #:array-row-major-index
         #:array-total-size
         #:arrayp
         #:fill-pointer
         #:row-marjor-aref
         #:upgraded-array-element-type
         #:array-dimension-limit
         #:array-rank-limit
         #:array-total-size-limit
         #:simple-vector-p
         #:svref
         #:vector
         #:vector-pop
         #:vector-push
         #:vector-push-extend
         #:vectorp
         #:bit
         #:sbit
         #:bit-not
         #:bit-vector-p
         #:simple-bit-vector-p))
  (:export . #1#))
