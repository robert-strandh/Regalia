(cl:in-package #:regalia)

(defgeneric arrayp (object)
  (:method (object) nil)
  (:method ((object array)) t))

(setf (documentation 'arrayp 'function)
      (format nil
              "Syntax: arrayp object~@
               ~@
               This function returns T if OBJECT is of type ARRAY.~@
               Otherwise it return NIL."))
