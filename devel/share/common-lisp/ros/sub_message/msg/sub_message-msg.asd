
(cl:in-package :asdf)

(defsystem "sub_message-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "arduino_msg" :depends-on ("_package_arduino_msg"))
    (:file "_package_arduino_msg" :depends-on ("_package"))
  ))