; Auto-generated. Do not edit!


(cl:in-package sub_message-srv)


;//! \htmlinclude SubMessage-request.msg.html

(cl:defclass <SubMessage-request> (roslisp-msg-protocol:ros-message)
  ((opperation
    :reader opperation
    :initarg :opperation
    :type cl:string
    :initform "")
   (direction
    :reader direction
    :initarg :direction
    :type cl:string
    :initform "")
   (distance
    :reader distance
    :initarg :distance
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

(cl:ensure-generic-function 'opperation-val :lambda-list '(m))
(cl:defmethod opperation-val ((m <SubMessage-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sub_message-srv:opperation-val is deprecated.  Use sub_message-srv:opperation instead.")
  (opperation m))

(cl:ensure-generic-function 'direction-val :lambda-list '(m))
(cl:defmethod direction-val ((m <SubMessage-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sub_message-srv:direction-val is deprecated.  Use sub_message-srv:direction instead.")
  (direction m))

(cl:ensure-generic-function 'distance-val :lambda-list '(m))
(cl:defmethod distance-val ((m <SubMessage-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sub_message-srv:distance-val is deprecated.  Use sub_message-srv:distance instead.")
  (distance m))

(cl:ensure-generic-function 'sent_time-val :lambda-list '(m))
(cl:defmethod sent_time-val ((m <SubMessage-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sub_message-srv:sent_time-val is deprecated.  Use sub_message-srv:sent_time instead.")
  (sent_time m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SubMessage-request>) ostream)
  "Serializes a message object of type '<SubMessage-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'opperation))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'opperation))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'direction))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'direction))
  (cl:let* ((signed (cl:slot-value msg 'distance)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
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
      (cl:setf (cl:slot-value msg 'opperation) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'opperation) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'direction) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'direction) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'distance) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
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
  "1cd8427867f185156c31422a9538a726")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SubMessage-request)))
  "Returns md5sum for a message object of type 'SubMessage-request"
  "1cd8427867f185156c31422a9538a726")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SubMessage-request>)))
  "Returns full string definition for message of type '<SubMessage-request>"
  (cl:format cl:nil "string opperation~%string direction~%int64 distance~%time sent_time~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SubMessage-request)))
  "Returns full string definition for message of type 'SubMessage-request"
  (cl:format cl:nil "string opperation~%string direction~%int64 distance~%time sent_time~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SubMessage-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'opperation))
     4 (cl:length (cl:slot-value msg 'direction))
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SubMessage-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SubMessage-request
    (cl:cons ':opperation (opperation msg))
    (cl:cons ':direction (direction msg))
    (cl:cons ':distance (distance msg))
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
  "1cd8427867f185156c31422a9538a726")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SubMessage-response)))
  "Returns md5sum for a message object of type 'SubMessage-response"
  "1cd8427867f185156c31422a9538a726")
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