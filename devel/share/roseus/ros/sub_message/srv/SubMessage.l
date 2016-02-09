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
  :slots (_command _x _y _z _t ))

(defmethod sub_message::SubMessageRequest
  (:init
   (&key
    ((:command __command) "")
    ((:x __x) 0)
    ((:y __y) 0)
    ((:z __z) 0)
    ((:t __t) 0.0)
    )
   (send-super :init)
   (setq _command (string __command))
   (setq _x (round __x))
   (setq _y (round __y))
   (setq _z (round __z))
   (setq _t (float __t))
   self)
  (:command
   (&optional __command)
   (if __command (setq _command __command)) _command)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:t
   (&optional __t)
   (if __t (setq _t __t)) _t)
  (:serialization-length
   ()
   (+
    ;; string _command
    4 (length _command)
    ;; int32 _x
    4
    ;; int32 _y
    4
    ;; int32 _z
    4
    ;; float32 _t
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _command
       (write-long (length _command) s) (princ _command s)
     ;; int32 _x
       (write-long _x s)
     ;; int32 _y
       (write-long _y s)
     ;; int32 _z
       (write-long _z s)
     ;; float32 _t
       (sys::poke _t (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _command
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _command (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _x
     (setq _x (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _y
     (setq _y (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _z
     (setq _z (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _t
     (setq _t (sys::peek buf ptr- :float)) (incf ptr- 4)
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

(setf (get sub_message::SubMessage :md5sum-) "a7d4942f6b9ec1a8538f6a56befa7a61")
(setf (get sub_message::SubMessage :datatype-) "sub_message/SubMessage")
(setf (get sub_message::SubMessage :request) sub_message::SubMessageRequest)
(setf (get sub_message::SubMessage :response) sub_message::SubMessageResponse)

(defmethod sub_message::SubMessageRequest
  (:response () (instance sub_message::SubMessageResponse :init)))

(setf (get sub_message::SubMessageRequest :md5sum-) "a7d4942f6b9ec1a8538f6a56befa7a61")
(setf (get sub_message::SubMessageRequest :datatype-) "sub_message/SubMessageRequest")
(setf (get sub_message::SubMessageRequest :definition-)
      "string command
int32 x
int32 y
int32 z
float32 t
---
string responce

")

(setf (get sub_message::SubMessageResponse :md5sum-) "a7d4942f6b9ec1a8538f6a56befa7a61")
(setf (get sub_message::SubMessageResponse :datatype-) "sub_message/SubMessageResponse")
(setf (get sub_message::SubMessageResponse :definition-)
      "string command
int32 x
int32 y
int32 z
float32 t
---
string responce

")



(provide :sub_message/SubMessage "a7d4942f6b9ec1a8538f6a56befa7a61")


