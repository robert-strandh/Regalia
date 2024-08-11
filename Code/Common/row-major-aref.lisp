(cl:in-package #:regalia)

(defgeneric row-major-aref-unchecked (array index))

(defgeneric (setf row-major-aref-unchecked) (new-element array index))

(defmethod row-major-aref-unchecked
    ((array array-signed-byte-64) index)
  (signed-64-bit-aref array index))

(defmethod (setf row-major-aref-unchecked)
    (new-element (array array-signed-byte-64) index)
  (setf (signed-64-bit-aref array index) new-element))

(defmethod row-major-aref-unchecked
    ((array array-unsigned-byte-64) index)
  (unsigned-64-bit-aref array index))

(defmethod (setf row-major-aref-unchecked)
    (new-element (array array-unsigned-byte-64) index)
  (setf (unsigned-64-bit-aref array index) new-element))

(defmethod row-major-aref-unchecked
    ((array array-signed-byte-32) index)
  (signed-32-bit-aref array index))

(defmethod (setf row-major-aref-unchecked)
    (new-element (array array-signed-byte-32) index)
  (setf (signed-32-bit-aref array index) new-element))

(defmethod row-major-aref-unchecked
    ((array array-unsigned-byte-32) index)
  (unsigned-32-bit-aref array index))

(defmethod (setf row-major-aref-unchecked)
    (new-element (array array-unsigned-byte-32) index)
  (setf (unsigned-32-bit-aref array index) new-element))

(defmethod row-major-aref-unchecked
    ((array array-signed-byte-16) index)
  (signed-16-bit-aref array index))

(defmethod (setf row-major-aref-unchecked)
    (new-element (array array-signed-byte-16) index)
  (setf (signed-16-bit-aref array index) new-element))

(defmethod row-major-aref-unchecked
    ((array array-unsigned-byte-16) index)
  (unsigned-16-bit-aref array index))

(defmethod (setf row-major-aref-unchecked)
    (new-element (array array-unsigned-byte-16) index)
  (setf (unsigned-16-bit-aref array index) new-element))

(defmethod row-major-aref-unchecked
    ((array array-signed-byte-8) index)
  (signed-8-bit-aref array index))

(defmethod (setf row-major-aref-unchecked)
    (new-element (array array-signed-byte-8) index)
  (setf (signed-8-bit-aref array index) new-element))

(defmethod row-major-aref-unchecked
    ((array array-unsigned-byte-8) index)
  (unsigned-8-bit-aref array index))

(defmethod (setf row-major-aref-unchecked)
    (new-element (array array-unsigned-byte-8) index)
  (setf (unsigned-8-bit-aref array index) new-element))

(defmethod row-major-aref-unchecked
    ((array array-single-float) index)
  (single-float-aref array index))

(defmethod (setf row-major-aref-unchecked)
    (new-element (array array-single-float) index)
  (setf (single-float-aref array index) new-element))

(defmethod row-major-aref-unchecked
    ((array array-double-float) index)
  (double-float-aref array index))

(defmethod (setf row-major-aref-unchecked)
    (new-element (array array-double-float) index)
  (setf (double-float-aref array index) new-element))

(defmethod row-major-aref-unchecked
    ((array array-character) index)
  (character-aref array index))

(defmethod (setf row-major-aref-unchecked)
    (new-element (array array-character) index)
  (setf (character-aref array index) new-element))

(defmethod row-major-aref-unchecked
    ((array array-bit) index)
  (bit-aref array index))

(defmethod (setf row-major-aref-unchecked)
    (new-element (array array-bit) index)
  (setf (bit-aref array index) new-element))
