(cl:in-package #:common-lisp-user)

(defpackage #:regalia
  (:use #:common-lisp)
  (:shadow #:array #:array-dimensions)
  (:export #:array))
