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
  :slots (_command _x _y _z _t _sent_time ))

(defmethod sub_message::SubMessageRequest
  (:init
   (&key
    ((:command __command) "")
    ((:x __x) 0)
    ((:y __y) 0)
    ((:z __z) 0)
    ((:t __t) 0)
    ((:sent_time __sent_time) (instance ros::time :init))
    )
   (send-super :init)
   (setq _command (string __command))
   (setq _x (round __x))
   (setq _y (round __y))
   (setq _z (round __z))
   (setq _t (round __t))
   (setq _sent_time __sent_time)
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
  (:sent_time
   (&optional __sent_time)
   (if __sent_time (setq _sent_time __sent_time)) _sent_time)
  (:serialization-length
   ()
   (+
    ;; string _command
    4 (length _command)
    ;; int64 _x
    8
    ;; int64 _y
    8
    ;; int64 _z
    8
    ;; int64 _t
    8
    ;; time _sent_time
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _command
       (write-long (length _command) s) (princ _command s)
     ;; int64 _x
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _x (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _x) (= (length (_x . bv)) 2)) ;; bignum
              (write-long (ash (elt (_x . bv) 0) 0) s)
              (write-long (ash (elt (_x . bv) 1) -1) s))
             ((and (class _x) (= (length (_x . bv)) 1)) ;; big1
              (write-long (elt (_x . bv) 0) s)
              (write-long (if (>= _x 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _x s)(write-long (if (>= _x 0) 0 #xffffffff) s)))
     ;; int64 _y
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _y (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _y) (= (length (_y . bv)) 2)) ;; bignum
              (write-long (ash (elt (_y . bv) 0) 0) s)
              (write-long (ash (elt (_y . bv) 1) -1) s))
             ((and (class _y) (= (length (_y . bv)) 1)) ;; big1
              (write-long (elt (_y . bv) 0) s)
              (write-long (if (>= _y 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _y s)(write-long (if (>= _y 0) 0 #xffffffff) s)))
     ;; int64 _z
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _z (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _z) (= (length (_z . bv)) 2)) ;; bignum
              (write-long (ash (elt (_z . bv) 0) 0) s)
              (write-long (ash (elt (_z . bv) 1) -1) s))
             ((and (class _z) (= (length (_z . bv)) 1)) ;; big1
              (write-long (elt (_z . bv) 0) s)
              (write-long (if (>= _z 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _z s)(write-long (if (>= _z 0) 0 #xffffffff) s)))
     ;; int64 _t
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _t (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _t) (= (length (_t . bv)) 2)) ;; bignum
              (write-long (ash (elt (_t . bv) 0) 0) s)
              (write-long (ash (elt (_t . bv) 1) -1) s))
             ((and (class _t) (= (length (_t . bv)) 1)) ;; big1
              (write-long (elt (_t . bv) 0) s)
              (write-long (if (>= _t 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _t s)(write-long (if (>= _t 0) 0 #xffffffff) s)))
     ;; time _sent_time
       (write-long (send _sent_time :sec) s) (write-long (send _sent_time :nsec) s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _command
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _command (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int64 _x
#+(or :alpha :irix6 :x86_64)
      (setf _x (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _x (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _y
#+(or :alpha :irix6 :x86_64)
      (setf _y (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _y (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _z
#+(or :alpha :irix6 :x86_64)
      (setf _z (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _z (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _t
#+(or :alpha :irix6 :x86_64)
      (setf _t (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _t (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
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

(setf (get sub_message::SubMessage :md5sum-) "7d28c6987997ca8d19b07ed2713e8a66")
(setf (get sub_message::SubMessage :datatype-) "sub_message/SubMessage")
(setf (get sub_message::SubMessage :request) sub_message::SubMessageRequest)
(setf (get sub_message::SubMessage :response) sub_message::SubMessageResponse)

(defmethod sub_message::SubMessageRequest
  (:response () (instance sub_message::SubMessageResponse :init)))

(setf (get sub_message::SubMessageRequest :md5sum-) "7d28c6987997ca8d19b07ed2713e8a66")
(setf (get sub_message::SubMessageRequest :datatype-) "sub_message/SubMessageRequest")
(setf (get sub_message::SubMessageRequest :definition-)
      "string command
int64 x
int64 y
int64 z
int64 t
time sent_time
---
string responce

")

(setf (get sub_message::SubMessageResponse :md5sum-) "7d28c6987997ca8d19b07ed2713e8a66")
(setf (get sub_message::SubMessageResponse :datatype-) "sub_message/SubMessageResponse")
(setf (get sub_message::SubMessageResponse :definition-)
      "string command
int64 x
int64 y
int64 z
int64 t
time sent_time
---
string responce

")



(provide :sub_message/SubMessage "7d28c6987997ca8d19b07ed2713e8a66")


