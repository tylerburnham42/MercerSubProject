; Auto-generated. Do not edit!


(cl:in-package sub_message-srv)


;//! \htmlinclude SubMessage-request.msg.html

(cl:defclass <SubMessage-request> (roslisp-msg-protocol:ros-message)
  ((command
    :reader command
    :initarg :command
    :type cl:string
    :initform "")
   (x
    :reader x
    :initarg :x
    :type cl:integer
    :initform 0)
   (y
    :reader y
    :initarg :y
    :type cl:integer
    :initform 0)
   (z
    :reader z
    :initarg :z
    :type cl:integer
    :initform 0)
   (t
    :reader t
    :initarg :t
    :type cl:integer
    :initform 0)
   (sent_time
    :reader sent_time
    :initarg :sent_time
    :type cl:real
    :initform 0))
)

(cl:defclass SubMessage-request (<SubMessage-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SubMessage-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SubMessage-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sub_message-srv:<SubMessage-request> is deprecated: use sub_message-srv:SubMessage-request instead.")))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <SubMessage-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sub_message-srv:command-val is deprecated.  Use sub_message-srv:command instead.")
  (command m))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <SubMessage-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sub_message-srv:x-val is deprecated.  Use sub_message-srv:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <SubMessage-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sub_message-srv:y-val is deprecated.  Use sub_message-srv:y instead.")
  (y m))

(cl:ensure-generic-function 'z-val :lambda-list '(m))
(cl:defmethod z-val ((m <SubMessage-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sub_message-srv:z-val is deprecated.  Use sub_message-srv:z instead.")
  (z m))

(cl:ensure-generic-function 't-val :lambda-list '(m))
(cl:defmethod t-val ((m <SubMessage-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sub_message-srv:t-val is deprecated.  Use sub_message-srv:t instead.")
  (t m))

(cl:ensure-generic-function 'sent_time-val :lambda-list '(m))
(cl:defmethod sent_time-val ((m <SubMessage-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sub_message-srv:sent_time-val is deprecated.  Use sub_message-srv:sent_time instead.")
  (sent_time m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SubMessage-request>) ostream)
  "Serializes a message object of type '<SubMessage-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'command))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'command))
  (cl:let* ((signed (cl:slot-value msg 'x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'y)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'z)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 't)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'sent_time)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'sent_time) (cl:floor (cl:slot-value msg 'sent_time)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SubMessage-request>) istream)
  "Deserializes a message object of type '<SubMessage-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'command) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'command) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'x) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'y) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'z) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 't) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sent_time) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SubMessage-request>)))
  "Returns string type for a service object of type '<SubMessage-request>"
  "sub_message/SubMessageRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SubMessage-request)))
  "Returns string type for a service object of type 'SubMessage-request"
  "sub_message/SubMessageRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SubMessage-request>)))
  "Returns md5sum for a message object of type '<SubMessage-request>"
  "7d28c6987997ca8d19b07ed2713e8a66")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SubMessage-request)))
  "Returns md5sum for a message object of type 'SubMessage-request"
  "7d28c6987997ca8d19b07ed2713e8a66")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SubMessage-request>)))
  "Returns full string definition for message of type '<SubMessage-request>"
  (cl:format cl:nil "string command~%int64 x~%int64 y~%int64 z~%int64 t~%time sent_time~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SubMessage-request)))
  "Returns full string definition for message of type 'SubMessage-request"
  (cl:format cl:nil "string command~%int64 x~%int64 y~%int64 z~%int64 t~%time sent_time~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SubMessage-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'command))
     8
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SubMessage-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SubMessage-request
    (cl:cons ':command (command msg))
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':z (z msg))
    (cl:cons ':t (t msg))
    (cl:cons ':sent_time (sent_time msg))
))
;//! \htmlinclude SubMessage-response.msg.html

(cl:defclass <SubMessage-response> (roslisp-msg-protocol:ros-message)
  ((responce
    :reader responce
    :initarg :responce
    :type cl:string
    :initform ""))
)

(cl:defclass SubMessage-response (<SubMessage-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SubMessage-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SubMessage-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sub_message-srv:<SubMessage-response> is deprecated: use sub_message-srv:SubMessage-response instead.")))

(cl:ensure-generic-function 'responce-val :lambda-list '(m))
(cl:defmethod responce-val ((m <SubMessage-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sub_message-srv:responce-val is deprecated.  Use sub_message-srv:responce instead.")
  (responce m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SubMessage-response>) ostream)
  "Serializes a message object of type '<SubMessage-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'responce))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'responce))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SubMessage-response>) istream)
  "Deserializes a message object of type '<SubMessage-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'responce) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'responce) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SubMessage-response>)))
  "Returns string type for a service object of type '<SubMessage-response>"
  "sub_message/SubMessageResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SubMessage-response)))
  "Returns string type for a service object of type 'SubMessage-response"
  "sub_message/SubMessageResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SubMessage-response>)))
  "Returns md5sum for a message object of type '<SubMessage-response>"
  "7d28c6987997ca8d19b07ed2713e8a66")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SubMessage-response)))
  "Returns md5sum for a message object of type 'SubMessage-response"
  "7d28c6987997ca8d19b07ed2713e8a66")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SubMessage-response>)))
  "Returns full string definition for message of type '<SubMessage-response>"
  (cl:format cl:nil "string responce~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SubMessage-response)))
  "Returns full string definition for message of type 'SubMessage-response"
  (cl:format cl:nil "string responce~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SubMessage-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'responce))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SubMessage-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SubMessage-response
    (cl:cons ':responce (responce msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SubMessage)))
  'SubMessage-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SubMessage)))
  'SubMessage-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SubMessage)))
  "Returns string type for a service object of type '<SubMessage>"
  "sub_message/SubMessage")