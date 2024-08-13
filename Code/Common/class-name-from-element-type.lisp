(cl:in-package #:regalia)

(defun vector-class-name-from-element-type (element-type environment)
  (cond ((subtypep element-type 'cl:bit environment)
         'vector-bit)
        ((subtypep element-type '(unsigned-byte 8) environment)
         'vector-unsigned-byte-8)
        ((subtypep element-type '(signed-byte 16) environment)
         'vector-signed-byte-16)
        ((subtypep element-type '(unsigned-byte 16) environment)
         'vector-unsigned-byte-16)
        ((subtypep element-type '(signed-byte 32) environment)
         'vector-signed-byte-32)
        ((subtypep element-type '(unsigned-byte 32) environment)
         'vector-unsigned-byte-32)
        ((subtypep element-type '(signed-byte 64) environment)
         'vector-signed-byte-64)
        ((subtypep element-type '(unsigned-byte 64) environment)
         'vector-unsigned-byte-64)
        ((subtypep element-type 'single-float environment)
         'vector-single-float)
        ((subtypep element-type 'double-float environment)
         'vector-double-float)
        ((subtypep element-type '(complex single-float) environment)
         'vector-complex-single-float)
        ((subtypep element-type '(complex double-float) environment)
         'vector-complex-double-float)
        (t
         'simple-vector)))
