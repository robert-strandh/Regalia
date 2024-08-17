(cl:in-package #:regalia)

(defgeneric arrayp (object)
  (:method (object) nil)
  (:method ((object array)) t))

