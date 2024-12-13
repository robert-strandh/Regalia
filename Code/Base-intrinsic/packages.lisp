(cl:in-package #:common-lisp-user)

(defpackage #:regalia
  (:use #:common-lisp)
  (:export
   #:make-array-instance
   #:t-aref
   #:signed-64-bit-aref
   #:unsigned-64-bit-aref
   #:signed-32-bit-aref
   #:unsigned-32-bit-aref
   #:signed-16-bit-aref
   #:unsigned-16-bit-aref
   #:signed-8-bit-aref
   #:unsigned-8-bit-aref
   #:single-float-aref
   #:double-float-aref
   #:complex-single-float-aref
   #:complex-double-float-aref
   #:character-aref
   #:bit-aref))
