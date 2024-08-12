(cl:in-package #:regalia)

(defun upgraded-array-element-type (type-specifier &optional environment)
  (cond ((subtypep type-specifier 'cl:bit environment)
         'cl:bit)
        ((subtypep type-specifier '(signed-byte 8) environment)
         '(signed-byte 8))
        ((subtypep type-specifier '(unsigned-byte 8) environment)
         '(unsigned-byte 8))
        ((subtypep type-specifier '(signed-byte 16) environment)
         '(signed-byte 16))
        ((subtypep type-specifier '(unsigned-byte 16) environment)
         '(unsigned-byte 16))
        ((subtypep type-specifier '(signed-byte 32) environment)
         '(signed-byte 32))
        ((subtypep type-specifier '(unsigned-byte 32) environment)
         '(unsigned-byte 32))
        ((subtypep type-specifier '(signed-byte 64) environment)
         '(signed-byte 64))
        ((subtypep type-specifier '(unsigned-byte 64) environment)
         '(unsigned-byte 64))
        ((subtypep type-specifier '(complex double-float) environment)
         '(complex-double-float))
        ((subtypep type-specifier '(complex single-float) environment)
         '(complex-single-float))
        ((subtypep type-specifier 'double-float environment)
         'double-float)
        ((subtypep type-specifier 'single-float environment)
         'single-float)
        ((subtypep type-specifier 'character environment)
         'character)
        (t
         't)))