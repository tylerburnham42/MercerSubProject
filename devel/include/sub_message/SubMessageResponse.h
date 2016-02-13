// Generated by gencpp from file sub_message/SubMessageResponse.msg
// DO NOT EDIT!


#ifndef SUB_MESSAGE_MESSAGE_SUBMESSAGERESPONSE_H
#define SUB_MESSAGE_MESSAGE_SUBMESSAGERESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace sub_message
{
template <class ContainerAllocator>
struct SubMessageResponse_
{
  typedef SubMessageResponse_<ContainerAllocator> Type;

  SubMessageResponse_()
    : responce()  {
    }
  SubMessageResponse_(const ContainerAllocator& _alloc)
    : responce(_alloc)  {
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _responce_type;
  _responce_type responce;




  typedef boost::shared_ptr< ::sub_message::SubMessageResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::sub_message::SubMessageResponse_<ContainerAllocator> const> ConstPtr;

}; // struct SubMessageResponse_

typedef ::sub_message::SubMessageResponse_<std::allocator<void> > SubMessageResponse;

typedef boost::shared_ptr< ::sub_message::SubMessageResponse > SubMessageResponsePtr;
typedef boost::shared_ptr< ::sub_message::SubMessageResponse const> SubMessageResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::sub_message::SubMessageResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::sub_message::SubMessageResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace sub_message

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'sub_message': ['/home/tylerburnham42/MercerSubProject/src/sub_message/msg'], 'std_msgs': ['/opt/ros/jade/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::sub_message::SubMessageResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::sub_message::SubMessageResponse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::sub_message::SubMessageResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::sub_message::SubMessageResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::sub_message::SubMessageResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::sub_message::SubMessageResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::sub_message::SubMessageResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "714ef05653d49e4a68d14ae9ce55ed2f";
  }

  static const char* value(const ::sub_message::SubMessageResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x714ef05653d49e4aULL;
  static const uint64_t static_value2 = 0x68d14ae9ce55ed2fULL;
};

template<class ContainerAllocator>
struct DataType< ::sub_message::SubMessageResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "sub_message/SubMessageResponse";
  }

  static const char* value(const ::sub_message::SubMessageResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::sub_message::SubMessageResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string responce\n\
\n\
";
  }

  static const char* value(const ::sub_message::SubMessageResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::sub_message::SubMessageResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.responce);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct SubMessageResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::sub_message::SubMessageResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::sub_message::SubMessageResponse_<ContainerAllocator>& v)
  {
    s << indent << "responce: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.responce);
  }
};

} // namespace message_operations
} // namespace ros

#endif // SUB_MESSAGE_MESSAGE_SUBMESSAGERESPONSE_H
