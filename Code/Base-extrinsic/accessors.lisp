(cl:in-package #:regalia)

(defgeneric contents (array))

(defun t-aref (array index)
  (cl:svref (contents array) index))

(defun (setf t-aref) (new-element array index)
  (setf (cl:svref (contents array) index) new-element))

(defun signed-64-bit-aref (array index)
  (cl:svref (contents array) index))

(defun (setf signed-64-bit-aref) (new-element array index)
  (setf (cl:svref (contents array) index) new-element))

(defun unsigned-64-bit-aref (array index)
  (cl:svref (contents array) index))

(defun (setf unsigned-64-bit-aref) (new-element array index)
  (setf (cl:svref (contents array) index) new-element))

(defun signed-32-bit-aref (array index)
  (cl:svref (contents array) index))

(defun (setf signed-32-bit-aref) (new-element array index)
  (setf (cl:svref (contents array) index) new-element))

(defun unsigned-32-bit-aref (array index)
  (cl:svref (contents array) index))

(defun (setf unsigned-32-bit-aref) (new-element array index)
  (setf (cl:svref (contents array) index) new-element))

(defun signed-16-bit-aref (array index)
  (cl:svref (contents array) index))

(defun (setf signed-16-bit-aref) (new-element array index)
  (setf (cl:svref (contents array) index) new-element))

(defun unsigned-16-bit-aref (array index)
  (cl:svref (contents array) index))

(defun (setf unsigned-16-bit-aref) (new-element array index)
  (setf (cl:svref (contents array) index) new-element))

(defun signed-8-bit-aref (array index)
  (cl:svref (contents array) index))

(defun (setf signed-8-bit-aref) (new-element array index)
  (setf (cl:svref (contents array) index) new-element))

(defun unsigned-8-bit-aref (array index)
  (cl:svref (contents array) index))

(defun (setf unsigned-8-bit-aref) (new-element array index)
  (setf (cl:svref (contents array) index) new-element))

(defun single-float-aref (array index)
  (cl:svref (contents array) index))

(defun (setf single-float-aref) (new-element array index)
  (setf (cl:svref (contents array) index) new-element))

(defun double-float-aref (array index)
  (cl:svref (contents array) index))

(defun (setf double-float-aref) (new-element array index)
  (setf (cl:svref (contents array) index) new-element))

(defun complex-single-float-aref (array index)
  (cl:svref (contents array) (* 2 index)))

(defun (setf complex-single-float-aref) (new-element array index)
  (setf (cl:svref (contents array) (* 2 index)) new-element))

(defun complex-double-float-aref (array index)
  (cl:svref (contents array) (* 2 index)))

(defun (setf complex-double-float-aref) (new-element array index)
  (setf (cl:svref (contents array) (* 2 index)) new-element))

(defun character-aref (array index)
  (cl:schar array index))

(defun (setf character-aref) (new-element array index)
  (setf (cl:schar array index) new-element))

(defun bit-aref (array index)
  (cl:sbit array index))

(defun (setf bit-aref) (new-element array index)
  (setf (cl:sbit array index) new-element))
