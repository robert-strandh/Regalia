(cl:in-package #:regalia)

(defun proper-list-p (list)
  (integerp (ignore-errors (list-length list))))

(defun valid-dimension-p (dimension)
  (typep dimension `(integer 0 (,array-dimension-limit))))

(defun check-and-canonicalize-dimensions (dimensions)
  (cond ((valid-dimension-p dimensions)
         (list dimensions))
        ((and (proper-list-p dimensions)
              (every #'valid-dimension-p dimensions)
              (< (apply #'* dimensions) array-total-size-limit))
         dimensions)
        (t
         (error 'invalid-dimensions
                :dimensions dimensions))))


