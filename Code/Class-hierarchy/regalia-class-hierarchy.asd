(cl:in-package #:asdf-user)

(defsystem "regalia-class-hierarchy"
  :serial t
  :components
  ((:file "array")
   (:file "array-t")
   (:file "array-unsigned-byte-64")
   (:file "array-signed-byte-64")
   (:file "array-unsigned-byte-32")
   (:file "array-signed-byte-32")
   (:file "array-unsigned-byte-16")
   (:file "array-signed-byte-16")
   (:file "array-unsigned-byte-8")
   (:file "array-signed-byte-8")
   (:file "array-double-float")
   (:file "array-single-float")
   (:file "array-complex-double-float")
   (:file "array-complex-single-float")
   (:file "array-character")))
