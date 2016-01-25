// Generated by gencpp from file sub_message/SubMessage.msg
// DO NOT EDIT!


#ifndef SUB_MESSAGE_MESSAGE_SUBMESSAGE_H
#define SUB_MESSAGE_MESSAGE_SUBMESSAGE_H

#include <ros/service_traits.h>


#include <sub_message/SubMessageRequest.h>
#include <sub_message/SubMessageResponse.h>


namespace sub_message
{

struct SubMessage
{

typedef SubMessageRequest Request;
typedef SubMessageResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct SubMessage
} // namespace sub_message


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::sub_message::SubMessage > {
  static const char* value()
  {
    return "7d28c6987997ca8d19b07ed2713e8a66";
  }

  static const char* value(const ::sub_message::SubMessage&) { return value(); }
};

template<>
struct DataType< ::sub_message::SubMessage > {
  static const char* value()
  {
    return "sub_message/SubMessage";
  }

  static const char* value(const ::sub_message::SubMessage&) { return value(); }
};


// service_traits::MD5Sum< ::sub_message::SubMessageRequest> should match 
// service_traits::MD5Sum< ::sub_message::SubMessage > 
template<>
struct MD5Sum< ::sub_message::SubMessageRequest>
{
  static const char* value()
  {
    return MD5Sum< ::sub_message::SubMessage >::value();
  }
  static const char* value(const ::sub_message::SubMessageRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::sub_message::SubMessageRequest> should match 
// service_traits::DataType< ::sub_message::SubMessage > 
template<>
struct DataType< ::sub_message::SubMessageRequest>
{
  static const char* value()
  {
    return DataType< ::sub_message::SubMessage >::value();
  }
  static const char* value(const ::sub_message::SubMessageRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::sub_message::SubMessageResponse> should match 
// service_traits::MD5Sum< ::sub_message::SubMessage > 
template<>
struct MD5Sum< ::sub_message::SubMessageResponse>
{
  static const char* value()
  {
    return MD5Sum< ::sub_message::SubMessage >::value();
  }
  static const char* value(const ::sub_message::SubMessageResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::sub_message::SubMessageResponse> should match 
// service_traits::DataType< ::sub_message::SubMessage > 
template<>
struct DataType< ::sub_message::SubMessageResponse>
{
  static const char* value()
  {
    return DataType< ::sub_message::SubMessage >::value();
  }
  static const char* value(const ::sub_message::SubMessageResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // SUB_MESSAGE_MESSAGE_SUBMESSAGE_H
