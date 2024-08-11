(cl:in-package #:asdf-user)

(defsystem "regalia-common"
  :serial t
  :components
  ((:file "simple-array-p")
   (:file "displaced-array-p")
   (:file "row-major-aref")
   (:file "aref")))
