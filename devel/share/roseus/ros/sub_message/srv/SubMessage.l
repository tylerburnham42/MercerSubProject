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
  :slots (_opperation _direction _distance _sent_time ))

(defmethod sub_message::SubMessageRequest
  (:init
   (&key
    ((:opperation __opperation) "")
    ((:direction __direction) "")
    ((:distance __distance) 0)
    ((:sent_time __sent_time) (instance ros::time :init))
    )
   (send-super :init)
   (setq _opperation (string __opperation))
   (setq _direction (string __direction))
   (setq _distance (round __distance))
   (setq _sent_time __sent_time)
   self)
  (:opperation
   (&optional __opperation)
   (if __opperation (setq _opperation __opperation)) _opperation)
  (:direction
   (&optional __direction)
   (if __direction (setq _direction __direction)) _direction)
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:sent_time
   (&optional __sent_time)
   (if __sent_time (setq _sent_time __sent_time)) _sent_time)
  (:serialization-length
   ()
   (+
    ;; string _opperation
    4 (length _opperation)
    ;; string _direction
    4 (length _direction)
    ;; int64 _distance
    8
    ;; time _sent_time
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _opperation
       (write-long (length _opperation) s) (princ _opperation s)
     ;; string _direction
       (write-long (length _direction) s) (princ _direction s)
     ;; int64 _distance
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _distance (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _distance) (= (length (_distance . bv)) 2)) ;; bignum
              (write-long (ash (elt (_distance . bv) 0) 0) s)
              (write-long (ash (elt (_distance . bv) 1) -1) s))
             ((and (class _distance) (= (length (_distance . bv)) 1)) ;; big1
              (write-long (elt (_distance . bv) 0) s)
              (write-long (if (>= _distance 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _distance s)(write-long (if (>= _distance 0) 0 #xffffffff) s)))
     ;; time _sent_time
       (write-long (send _sent_time :sec) s) (write-long (send _sent_time :nsec) s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _opperation
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _opperation (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _direction
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _direction (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int64 _distance
#+(or :alpha :irix6 :x86_64)
      (setf _distance (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _distance (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; time _sent_time
     (send _sent_time :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _sent_time :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
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

(setf (get sub_message::SubMessage :md5sum-) "1cd8427867f185156c31422a9538a726")
(setf (get sub_message::SubMessage :datatype-) "sub_message/SubMessage")
(setf (get sub_message::SubMessage :request) sub_message::SubMessageRequest)
(setf (get sub_message::SubMessage :response) sub_message::SubMessageResponse)

(defmethod sub_message::SubMessageRequest
  (:response () (instance sub_message::SubMessageResponse :init)))

(setf (get sub_message::SubMessageRequest :md5sum-) "1cd8427867f185156c31422a9538a726")
(setf (get sub_message::SubMessageRequest :datatype-) "sub_message/SubMessageRequest")
(setf (get sub_message::SubMessageRequest :definition-)
      "string opperation
string direction
int64 distance
time sent_time
---
string responce

")

(setf (get sub_message::SubMessageResponse :md5sum-) "1cd8427867f185156c31422a9538a726")
(setf (get sub_message::SubMessageResponse :datatype-) "sub_message/SubMessageResponse")
(setf (get sub_message::SubMessageResponse :definition-)
      "string opperation
string direction
int64 distance
time sent_time
---
string responce

")



(provide :sub_message/SubMessage "1cd8427867f185156c31422a9538a726")


