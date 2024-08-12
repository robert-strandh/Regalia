(cl:in-package #:asdf-user)

(defsystem "regalia-common"
  :serial t
  :components
  ((:file "simple-array-p")
   (:file "displaced-array-p")
   (:file "in-bounds-p")
   (:file "dimensions")
   (:file "total-size")
   (:file "row-major-index")
   (:file "row-major-aref")
   (:file "aref")
   (:file "condition-types")))
