(cl:in-package #:regalia)

(defmethod initialize-instance :after
    ((array array) &key size element-type &allow-other-keys)
  (reinitialize-instance array
    :contents (cl:make-array size :element-type element-type)))
