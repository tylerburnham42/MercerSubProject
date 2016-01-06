; Auto-generated. Do not edit!


(cl:in-package sub_message-srv)


;//! \htmlinclude SubMessage-request.msg.html

(cl:defclass <SubMessage-request> (roslisp-msg-protocol:ros-message)
  ((message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass SubMessage-request (<SubMessage-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SubMessage-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SubMessage-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sub_message-srv:<SubMessage-request> is deprecated: use sub_message-srv:SubMessage-request instead.")))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <SubMessage-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sub_message-srv:message-val is deprecated.  Use sub_message-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SubMessage-request>) ostream)
  "Serializes a message object of type '<SubMessage-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SubMessage-request>) istream)
  "Deserializes a message object of type '<SubMessage-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
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
  "b4e4bb66768d6b1bb6165ba4f214a3d8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SubMessage-request)))
  "Returns md5sum for a message object of type 'SubMessage-request"
  "b4e4bb66768d6b1bb6165ba4f214a3d8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SubMessage-request>)))
  "Returns full string definition for message of type '<SubMessage-request>"
  (cl:format cl:nil "string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SubMessage-request)))
  "Returns full string definition for message of type 'SubMessage-request"
  (cl:format cl:nil "string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SubMessage-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SubMessage-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SubMessage-request
    (cl:cons ':message (message msg))
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
  "b4e4bb66768d6b1bb6165ba4f214a3d8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SubMessage-response)))
  "Returns md5sum for a message object of type 'SubMessage-response"
  "b4e4bb66768d6b1bb6165ba4f214a3d8")
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