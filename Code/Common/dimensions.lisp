(cl:in-package #:regalia)

(defmethod array-dimensions :around ((array array))
  (if (or (array-is-simple-p array)
          (array-is-displaced-p array))
      (call-next-method)
      (array-dimensions (underlying-array array))))
