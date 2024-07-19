(cl:in-package #:asdf-user)

(defsystem "regalia-class-hierarchy"
  :serial t
  :components
  ((:file "array")
   (:file "array-t")
   (:file "array-unsigned-byte-64")
   (:file "array-signed-byte-64")
   (:file "array-unsigned-byte-32")
   (:file "array-signed-byte-32")))
