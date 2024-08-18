(cl:in-package #:regalia)

(defmethod initialize-instance :after
    ((array array)
     &key
       size
       element-type
       underlying-array
     &allow-other-keys)
  (when (null underlying-array)
    (reinitialize-instance array
      :contents (cl:make-array size :element-type element-type))))
