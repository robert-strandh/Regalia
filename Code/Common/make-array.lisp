(cl:in-package #:regalia)

;;;; A BASIC array is an array that is not adjustable, and not
;;;; displaced to another array.  This term is not the same as the
;;;; term SIMPLE in the standard, because although an array that is
;;;; not adjustable and not displaced is a simple array, the converse
;;;; is not true.

;;;; FIXME: can a basic vector have a fill pointer?

(defun default-initial-element (element-type environment)
  (cond ((subtypep element-type 'integer environment)
         0)
        ((subtypep element-type 'single-float environment)
         0f0)
        ((subtypep element-type 'double-float environment)
         0d0)
        ((subtypep element-type '(complex single-float) environment)
         #c(0f0 0f0))
        ((subtypep element-type '(complex double-float) environment)
         #c(0d0 0d0))
        ((subtypep element-type 'character)
         #\Space)))

(defun make-basic-vector (length element-type environment)
  (let ((class-name
          (vector-class-name-from-element-type element-type environment)))
    (make-instance class-name
      :dimensions (list length)
      :size length
      :element-type element-type)))

(defun make-basic-non-vector (dimensions element-type environment)
  (let ((class-name
          (vector-class-name-from-element-type element-type environment)))
    (make-instance class-name
      :dimensions dimensions
      :size (reduce #'* dimensions)
      :element-type element-type)))

(defun fill-array-with-element (array size element)
  (loop for i from 0 below size
        do (setf (aref array i) element)))

(defun fill-array-from-contents (dimensions contents step index array)
  (if (null dimensions)
      (setf (row-major-aref array index) contents)
      (progn (assert (= (length contents) (first dimensions)))
             (loop for i from index by step
                   for sequence in contents
                   do (foo (rest dimensions)
                           sequence
                           (/ step (first dimensions))
                           i
                           array)))))

