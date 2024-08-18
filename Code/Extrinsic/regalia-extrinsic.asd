(cl:in-package #:asdf-user)

(defsystem "regalia-extrinsic"
  :depends-on ("regalia-base-extrinsic"
               "regalia-class-hierarchy"
               "regalia-common")
  :serial t
  :components
  ((:file "array")
   (:file "initialize-instance")))
