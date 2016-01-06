
(cl:in-package :asdf)

(defsystem "sub_message-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "SubMessage" :depends-on ("_package_SubMessage"))
    (:file "_package_SubMessage" :depends-on ("_package"))
  ))