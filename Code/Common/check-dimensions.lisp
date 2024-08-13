(cl:in-package #:regalia)

(defun proper-list-p (list)
  (integerp (ignore-errors (list-length list))))

(defun valid-dimension-p (dimension)
  (typep dimension '(integer 0)))

(defun check-dimensions (dimensions)
  (unless (or (valid-dimension-p dimensions)
              (and (proper-list-p dimensions)
                   (every #'valid-dimension-p dimensions)))
    (error 'invalid-dimensions
           :dimensions dimensions)))

