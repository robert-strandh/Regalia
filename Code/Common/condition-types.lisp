(cl:in-package #:regalia)

(define-condition object-must-be-an-array
    (type-error)
  ()
  (:report (lambda (condition stream)
             (format stream
                     "An object of type ~s was expected,~@
                      but the following object was found instead~@
                      ~s"
                     (type-error-expected-type condition)
                     (type-error-datum condition)))))

(define-condition number-of-subscripts-must-equal-array-rank
    (error)
  ((%subscripts :initarg :subscripts :reader subscripts)
   (%array :initarg :array :reader given-array))
  (:report (lambda (condition stream)
             (format stream
                     "The following subscripts:~@
                      ~s~@
                      were given in order to access the array:~@
                      ~s~.@
                      However, the number of subscripts given is ~d~@
                      whereas the randk of the array is ~d."
                     (subscripts condition)
                     (given-array condition)
                     (length (subscripts condition))
                     (array-rank (given-array condition))))))

(define-condition subscript-must-be-non-negative-and-less-than-dimension
    (type-error)
  ((%array :initarg :array :reader given-array)
   (%subscript-number :initarg :subscript-number :reader subscript-number))
  (:report (lambda (condition stream)
             (format stream
                     "The ~:R subscript given in order to access the array:~@
                      ~s~@
                      has a value of ~s~@
                      but the ~:R dimension of the array is ~d,~@
                      so the subscript must be a non-negative integer~@
                      that is strictly less than that dimension."
                     (1+ (subscript-number condition))
                     (given-array condition)
                     (type-error-datum condition)
                     (1+ (subscript-number condition))
                     (array-dimension (given-array condition)
                                      (subscript-number condition))))))

(define-condition row-major-index-must-be-non-negative-and-less-than-total-size
    (type-error)
  ((%array :initarg :array :reader given-array))
  (:report (lambda (condition stream)
             (format stream
                     "The row-major index given in order to access the array:~@
                      ~s~@
                      has a value of ~s~@
                      but the total size of the array is ~d,~@
                      so the index must be a non-negative integer~@
                      that is strictly less than that size."
                     (given-array condition)
                     (type-error-datum condition)
                     (array-total-size (given-array condition))))))

(define-condition incompatible-type-for-new-element
    (type-error)
  ((%array :initarg :array :reader given-array))
  (:report (lambda (condition stream)
             (format stream
                     "The new element to be stored in the array is:~@
                      ~s of type ~s,~@
                      but the element type of the array to store it in:
                      ~s~@
                      is ~s,~@
                      which is incompatible with the type of the new element."
                     (type-error-datum condition)
                     (type-of (type-error-datum condition))
                     (given-array condition)
                     (type-error-expected-type condition)))))

(define-condition invalid-axis-number (type-error)
  ())

(define-condition invalid-dimensions (error)
  ((%dimensions :initarg :dimensions :reader dimensions))
  (:report (lambda (condition stream)
             (format stream
                     "Dimensions must be a designator for a list~@
                      of non-negative integers, but the following~@
                      was found instead:~@
                      ~s"
                     (dimensions condition)))))

(define-condition initial-element-cannot-be-supplied-for-displaced-array
    (error)
  ()
  (:report (lambda (condition stream)
             (declare (ignore condition))
             (format stream
                     "The keyword argument :INITIAL-ELEMENT cannot be~@
                      supplied when :DISPLACED-TO is supplied."))))

(define-condition initial-contents-cannot-be-supplied-for-displaced-array
    (error)
  ()
  (:report (lambda (condition stream)
             (declare (ignore condition))
             (format stream
                     "The keyword argument :INITIAL-CONTENTS cannot be~@
                      supplied when :DISPLACED-TO is supplied."))))

(define-condition initial-contents-and-initial-element-cannot-both-be-supplied
    (error)
  ()
  (:report (lambda (condition stream)
             (declare (ignore condition))
             (format stream
                     "The keyword arguments :INITIAL-CONTENTS and~@
                      :INITIAL-ELEMENT cannot both be supplied."))))

(define-condition displaced-index-offset-supplied-but-not-displaced-to
    (error)
  ()
  (:report (lambda (condition stream)
             (declare (ignore condition))
             (format stream
                     "The keyword argument :DISPLACED-INDEX-OFFSET was~@
                      supplied, but the keyword argument :DISPLACED-TO~@
                      was not supplied."))))

(define-condition contents-must-be-proper-list (error)
  ((%contents :initarg :contents :reader contents))
  (:report (lambda (condition stream)
             (format stream
                     "Contents list must be a proper list, but the~@
                      following was found instead:~@
                      ~s"
                     (contents condition)))))
