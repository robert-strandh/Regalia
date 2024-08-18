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


(defun fill-array-from-contents (array dimensions contents)
  (labels ((aux (dimensions contents step index)
             (if (null dimensions)
                 (setf (row-major-aref array index) contents)
                 (if (listp contents)
                     (let ((length (ignore-errors (list-length contents))))
                       (cond ((null length)
                              ;; FIXME: signal a more specific error.
                              (error "contents must be proper list"))
                             ((not (= length (first dimensions)))
                              ;; FIXME: signal a more specific error.
                              (error "incorrect contents length"))
                             (t 
                              (loop for i from index by step
                                    for sequence-or-element in contents
                                    do (aux (rest dimensions)
                                            sequence-or-element
                                            (/ step (first dimensions))
                                            i)))))
                     (let ((length (length contents)))
                       (if (not (= length (first dimensions)))
                           ;; FIXME: signal a more specific error.
                           (error "incorrect contents length")
                           (loop for i from index by step
                                 for sequence-or-element across contents
                                 do (aux (rest dimensions)
                                         sequence-or-element
                                         (/ step (first dimensions))
                                         i))))))))
    (aux dimensions contents (apply #'* (butlast dimensions)) 0)))

(defun make-array
    (dimensions
     &rest arguments
     &key
       (element-type t)
       (initial-element nil initial-element-p)
       (initial-contents nil initial-contents-p)
       adjustable
       fill-pointer
       displaced-to
       (displaced-index-offset 0 displaced-index-offset-p)
       environment)
  (let* ((canonicalized-dimensions
           (check-and-canonicalize-dimensions dimensions))
         (size (reduce #'* canonicalized-dimensions))
         (class-name
           (if (= (length canonicalized-dimensions) 1)
               (vector-class-name-from-element-type
                element-type environment)
               (non-vector-class-name-from-element-type
                element-type environment))))
    (cond ((not (null displaced-to))
           (unless (arrayp displaced-to)
             (error 'object-must-be-an-array
                    :datum displaced-to
                    :expected-type 'array))
           (when initial-element-p
             (error 'initial-element-cannot-be-given-for-displaced-array))
           (when initial-contents-p
             (error 'initial-contents-cannot-be-supplied-for-displaced-array))
           (make-instance class-name
             :dimensions canonicalized-dimensions
             :underlying-array displaced-to
             :displaced-index-offset displaced-index-offset))
          (adjustable
           (when displaced-index-offset-p
             (error 'displaced-index-offset-supplied-but-not-displaced-to))
           (let ((underlying-array
                   (apply #'make-array :adjustable nil arguments)))
             (make-instance class-name
               :dimensions canonicalized-dimensions
               :underlying-array underlying-array)))
          (t
           (let ((result (make-instance class-name
                           :size size
                           :dimensions canonicalized-dimensions)))
             (cond (initial-element-p
                    (when initial-contents-p
                      (error 'initial-contents-and-initial-element-cannot-both-be-supplied))
                    (fill-array-with-element
                     result
                     (reduce #'* canonicalized-dimensions)
                     initial-element))
                   (initial-contents-p
                    (fill-array-from-contents
                     result dimensions initial-contents))
                   (t
                    (let ((element
                            (default-initial-element
                             element-type environment)))
                      (fill-array-with-element
                       result
                       (reduce #'* canonicalized-dimensions)
                       element))))
                 result)))))
