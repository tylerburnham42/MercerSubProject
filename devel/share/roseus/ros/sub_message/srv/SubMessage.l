;; Auto-generated. Do not edit!


(when (boundp 'sub_message::SubMessage)
  (if (not (find-package "SUB_MESSAGE"))
    (make-package "SUB_MESSAGE"))
  (shadow 'SubMessage (find-package "SUB_MESSAGE")))
(unless (find-package "SUB_MESSAGE::SUBMESSAGE")
  (make-package "SUB_MESSAGE::SUBMESSAGE"))
(unless (find-package "SUB_MESSAGE::SUBMESSAGEREQUEST")
  (make-package "SUB_MESSAGE::SUBMESSAGEREQUEST"))
(unless (find-package "SUB_MESSAGE::SUBMESSAGERESPONSE")
  (make-package "SUB_MESSAGE::SUBMESSAGERESPONSE"))

(in-package "ROS")





(defclass sub_message::SubMessageRequest
  :super ros::object
  :slots (_message ))

(defmethod sub_message::SubMessageRequest
  (:init
   (&key
    ((:message __message) "")
    )
   (send-super :init)
   (setq _message (string __message))
   self)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass sub_message::SubMessageResponse
  :super ros::object
  :slots (_responce ))

(defmethod sub_message::SubMessageResponse
  (:init
   (&key
    ((:responce __responce) "")
    )
   (send-super :init)
   (setq _responce (string __responce))
   self)
  (:responce
   (&optional __responce)
   (if __responce (setq _responce __responce)) _responce)
  (:serialization-length
   ()
   (+
    ;; string _responce
    4 (length _responce)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _responce
       (write-long (length _responce) s) (princ _responce s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _responce
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _responce (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass sub_message::SubMessage
  :super ros::object
  :slots ())

(setf (get sub_message::SubMessage :md5sum-) "b4e4bb66768d6b1bb6165ba4f214a3d8")
(setf (get sub_message::SubMessage :datatype-) "sub_message/SubMessage")
(setf (get sub_message::SubMessage :request) sub_message::SubMessageRequest)
(setf (get sub_message::SubMessage :response) sub_message::SubMessageResponse)

(defmethod sub_message::SubMessageRequest
  (:response () (instance sub_message::SubMessageResponse :init)))

(setf (get sub_message::SubMessageRequest :md5sum-) "b4e4bb66768d6b1bb6165ba4f214a3d8")
(setf (get sub_message::SubMessageRequest :datatype-) "sub_message/SubMessageRequest")
(setf (get sub_message::SubMessageRequest :definition-)
      "string message
---
string responce

")

(setf (get sub_message::SubMessageResponse :md5sum-) "b4e4bb66768d6b1bb6165ba4f214a3d8")
(setf (get sub_message::SubMessageResponse :datatype-) "sub_message/SubMessageResponse")
(setf (get sub_message::SubMessageResponse :definition-)
      "string message
---
string responce

")



(provide :sub_message/SubMessage "b4e4bb66768d6b1bb6165ba4f214a3d8")


