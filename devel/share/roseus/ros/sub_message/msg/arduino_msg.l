;; Auto-generated. Do not edit!


(when (boundp 'sub_message::arduino_msg)
  (if (not (find-package "SUB_MESSAGE"))
    (make-package "SUB_MESSAGE"))
  (shadow 'arduino_msg (find-package "SUB_MESSAGE")))
(unless (find-package "SUB_MESSAGE::ARDUINO_MSG")
  (make-package "SUB_MESSAGE::ARDUINO_MSG"))

(in-package "ROS")
;;//! \htmlinclude arduino_msg.msg.html


(defclass sub_message::arduino_msg
  :super ros::object
  :slots (_frontLeft _frontMiddle _frontRight _backLeft _backMiddle _backRight ))

(defmethod sub_message::arduino_msg
  (:init
   (&key
    ((:frontLeft __frontLeft) 0)
    ((:frontMiddle __frontMiddle) 0)
    ((:frontRight __frontRight) 0)
    ((:backLeft __backLeft) 0)
    ((:backMiddle __backMiddle) 0)
    ((:backRight __backRight) 0)
    )
   (send-super :init)
   (setq _frontLeft (round __frontLeft))
   (setq _frontMiddle (round __frontMiddle))
   (setq _frontRight (round __frontRight))
   (setq _backLeft (round __backLeft))
   (setq _backMiddle (round __backMiddle))
   (setq _backRight (round __backRight))
   self)
  (:frontLeft
   (&optional __frontLeft)
   (if __frontLeft (setq _frontLeft __frontLeft)) _frontLeft)
  (:frontMiddle
   (&optional __frontMiddle)
   (if __frontMiddle (setq _frontMiddle __frontMiddle)) _frontMiddle)
  (:frontRight
   (&optional __frontRight)
   (if __frontRight (setq _frontRight __frontRight)) _frontRight)
  (:backLeft
   (&optional __backLeft)
   (if __backLeft (setq _backLeft __backLeft)) _backLeft)
  (:backMiddle
   (&optional __backMiddle)
   (if __backMiddle (setq _backMiddle __backMiddle)) _backMiddle)
  (:backRight
   (&optional __backRight)
   (if __backRight (setq _backRight __backRight)) _backRight)
  (:serialization-length
   ()
   (+
    ;; int32 _frontLeft
    4
    ;; int32 _frontMiddle
    4
    ;; int32 _frontRight
    4
    ;; int32 _backLeft
    4
    ;; int32 _backMiddle
    4
    ;; int32 _backRight
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _frontLeft
       (write-long _frontLeft s)
     ;; int32 _frontMiddle
       (write-long _frontMiddle s)
     ;; int32 _frontRight
       (write-long _frontRight s)
     ;; int32 _backLeft
       (write-long _backLeft s)
     ;; int32 _backMiddle
       (write-long _backMiddle s)
     ;; int32 _backRight
       (write-long _backRight s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _frontLeft
     (setq _frontLeft (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _frontMiddle
     (setq _frontMiddle (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _frontRight
     (setq _frontRight (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _backLeft
     (setq _backLeft (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _backMiddle
     (setq _backMiddle (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _backRight
     (setq _backRight (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get sub_message::arduino_msg :md5sum-) "bfea4772612819b51cf19b229d824ca0")
(setf (get sub_message::arduino_msg :datatype-) "sub_message/arduino_msg")
(setf (get sub_message::arduino_msg :definition-)
      "int32 frontLeft
int32 frontMiddle
int32 frontRight
int32 backLeft
int32 backMiddle
int32 backRight

")



(provide :sub_message/arduino_msg "bfea4772612819b51cf19b229d824ca0")


