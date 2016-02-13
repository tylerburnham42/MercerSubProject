; Auto-generated. Do not edit!


(cl:in-package sub_message-msg)


;//! \htmlinclude arduino_msg.msg.html

(cl:defclass <arduino_msg> (roslisp-msg-protocol:ros-message)
  ((frontLeft
    :reader frontLeft
    :initarg :frontLeft
    :type cl:integer
    :initform 0)
   (frontMiddle
    :reader frontMiddle
    :initarg :frontMiddle
    :type cl:integer
    :initform 0)
   (frontRight
    :reader frontRight
    :initarg :frontRight
    :type cl:integer
    :initform 0)
   (backLeft
    :reader backLeft
    :initarg :backLeft
    :type cl:integer
    :initform 0)
   (backMiddle
    :reader backMiddle
    :initarg :backMiddle
    :type cl:integer
    :initform 0)
   (backRight
    :reader backRight
    :initarg :backRight
    :type cl:integer
    :initform 0))
)

(cl:defclass arduino_msg (<arduino_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <arduino_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'arduino_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sub_message-msg:<arduino_msg> is deprecated: use sub_message-msg:arduino_msg instead.")))

(cl:ensure-generic-function 'frontLeft-val :lambda-list '(m))
(cl:defmethod frontLeft-val ((m <arduino_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sub_message-msg:frontLeft-val is deprecated.  Use sub_message-msg:frontLeft instead.")
  (frontLeft m))

(cl:ensure-generic-function 'frontMiddle-val :lambda-list '(m))
(cl:defmethod frontMiddle-val ((m <arduino_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sub_message-msg:frontMiddle-val is deprecated.  Use sub_message-msg:frontMiddle instead.")
  (frontMiddle m))

(cl:ensure-generic-function 'frontRight-val :lambda-list '(m))
(cl:defmethod frontRight-val ((m <arduino_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sub_message-msg:frontRight-val is deprecated.  Use sub_message-msg:frontRight instead.")
  (frontRight m))

(cl:ensure-generic-function 'backLeft-val :lambda-list '(m))
(cl:defmethod backLeft-val ((m <arduino_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sub_message-msg:backLeft-val is deprecated.  Use sub_message-msg:backLeft instead.")
  (backLeft m))

(cl:ensure-generic-function 'backMiddle-val :lambda-list '(m))
(cl:defmethod backMiddle-val ((m <arduino_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sub_message-msg:backMiddle-val is deprecated.  Use sub_message-msg:backMiddle instead.")
  (backMiddle m))

(cl:ensure-generic-function 'backRight-val :lambda-list '(m))
(cl:defmethod backRight-val ((m <arduino_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sub_message-msg:backRight-val is deprecated.  Use sub_message-msg:backRight instead.")
  (backRight m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <arduino_msg>) ostream)
  "Serializes a message object of type '<arduino_msg>"
  (cl:let* ((signed (cl:slot-value msg 'frontLeft)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'frontMiddle)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'frontRight)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'backLeft)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'backMiddle)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'backRight)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <arduino_msg>) istream)
  "Deserializes a message object of type '<arduino_msg>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'frontLeft) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'frontMiddle) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'frontRight) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'backLeft) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'backMiddle) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'backRight) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<arduino_msg>)))
  "Returns string type for a message object of type '<arduino_msg>"
  "sub_message/arduino_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'arduino_msg)))
  "Returns string type for a message object of type 'arduino_msg"
  "sub_message/arduino_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<arduino_msg>)))
  "Returns md5sum for a message object of type '<arduino_msg>"
  "bfea4772612819b51cf19b229d824ca0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'arduino_msg)))
  "Returns md5sum for a message object of type 'arduino_msg"
  "bfea4772612819b51cf19b229d824ca0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<arduino_msg>)))
  "Returns full string definition for message of type '<arduino_msg>"
  (cl:format cl:nil "int32 frontLeft~%int32 frontMiddle~%int32 frontRight~%int32 backLeft~%int32 backMiddle~%int32 backRight~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'arduino_msg)))
  "Returns full string definition for message of type 'arduino_msg"
  (cl:format cl:nil "int32 frontLeft~%int32 frontMiddle~%int32 frontRight~%int32 backLeft~%int32 backMiddle~%int32 backRight~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <arduino_msg>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <arduino_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'arduino_msg
    (cl:cons ':frontLeft (frontLeft msg))
    (cl:cons ':frontMiddle (frontMiddle msg))
    (cl:cons ':frontRight (frontRight msg))
    (cl:cons ':backLeft (backLeft msg))
    (cl:cons ':backMiddle (backMiddle msg))
    (cl:cons ':backRight (backRight msg))
))
