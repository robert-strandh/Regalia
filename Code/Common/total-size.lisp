(cl:in-package #:regalia)

(defun array-total-size (array)
  (apply #'* (array-dimensions array)))
