(cl:in-package #:regalia)

(defun element-bit-size (class-name)
  (ecase class-name
    ((vector-bit array-bit) 1)
    ((vector-unsigned-byte-8 array-unsigned-byte-8) 1)
    ((vector-unsigned-byte-16 vector-signed-byte-16) 16)
    ((array-unsigned-byte-16 array-signed-byte-16) 16)
    ((vector-unsigned-byte-32 vector-signed-byte-32) 32)
    ((array-unsigned-byte-32 array-signed-byte-32) 32)
    ((vector-unsigned-byte-64 vector-signed-byte-64) 64)
    ((array-unsigned-byte-64 array-signed-byte-64) 64)
    ((vector-single-float array-single-float) 32)
    ((vector-double-float array-double-float) 64)
    ((vector-complex-single-float array-complex-single-float) 64)
    ((vector-complex-double-float array-complex-double-float) 128)
    ((simple-vector array-t) 64)))

(defun size-from-element-count (element-count class-name)
  (* element-count (ceiling (element-bit-size class-name) 64)))