(cl:in-package #:asdf-user)

(defsystem "regalia-common"
  :serial t
  :components
  ((:file "variables")
   (:file "simple-array-p")
   (:file "displaced-array-p")
   (:file "in-bounds-p")
   (:file "dimensions")
   (:file "total-size")
   (:file "row-major-index")
   (:file "row-major-aref")
   (:file "aref")
   (:file "upgraded-element-type")
   (:file "class-name-from-element-type")
   (:file "check-dimensions")
   (:file "arrayp")
   (:file "make-array")
   (:file "adjustable-array-p")
   (:file "condition-types")))
