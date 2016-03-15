#ifndef _ROS_sub_message_arduino_msg_h
#define _ROS_sub_message_arduino_msg_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace sub_message
{

  class arduino_msg : public ros::Msg
  {
    public:
      int32_t frontLeft;
      int32_t frontMiddle;
      int32_t frontRight;
      int32_t backLeft;
      int32_t backMiddle;
      int32_t backRight;

    arduino_msg():
      frontLeft(0),
      frontMiddle(0),
      frontRight(0),
      backLeft(0),
      backMiddle(0),
      backRight(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const
    {
      int offset = 0;
      union {
        int32_t real;
        uint32_t base;
      } u_frontLeft;
      u_frontLeft.real = this->frontLeft;
      *(outbuffer + offset + 0) = (u_frontLeft.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_frontLeft.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_frontLeft.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_frontLeft.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->frontLeft);
      union {
        int32_t real;
        uint32_t base;
      } u_frontMiddle;
      u_frontMiddle.real = this->frontMiddle;
      *(outbuffer + offset + 0) = (u_frontMiddle.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_frontMiddle.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_frontMiddle.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_frontMiddle.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->frontMiddle);
      union {
        int32_t real;
        uint32_t base;
      } u_frontRight;
      u_frontRight.real = this->frontRight;
      *(outbuffer + offset + 0) = (u_frontRight.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_frontRight.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_frontRight.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_frontRight.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->frontRight);
      union {
        int32_t real;
        uint32_t base;
      } u_backLeft;
      u_backLeft.real = this->backLeft;
      *(outbuffer + offset + 0) = (u_backLeft.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_backLeft.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_backLeft.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_backLeft.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->backLeft);
      union {
        int32_t real;
        uint32_t base;
      } u_backMiddle;
      u_backMiddle.real = this->backMiddle;
      *(outbuffer + offset + 0) = (u_backMiddle.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_backMiddle.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_backMiddle.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_backMiddle.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->backMiddle);
      union {
        int32_t real;
        uint32_t base;
      } u_backRight;
      u_backRight.real = this->backRight;
      *(outbuffer + offset + 0) = (u_backRight.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_backRight.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_backRight.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_backRight.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->backRight);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer)
    {
      int offset = 0;
      union {
        int32_t real;
        uint32_t base;
      } u_frontLeft;
      u_frontLeft.base = 0;
      u_frontLeft.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_frontLeft.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_frontLeft.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_frontLeft.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->frontLeft = u_frontLeft.real;
      offset += sizeof(this->frontLeft);
      union {
        int32_t real;
        uint32_t base;
      } u_frontMiddle;
      u_frontMiddle.base = 0;
      u_frontMiddle.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_frontMiddle.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_frontMiddle.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_frontMiddle.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->frontMiddle = u_frontMiddle.real;
      offset += sizeof(this->frontMiddle);
      union {
        int32_t real;
        uint32_t base;
      } u_frontRight;
      u_frontRight.base = 0;
      u_frontRight.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_frontRight.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_frontRight.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_frontRight.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->frontRight = u_frontRight.real;
      offset += sizeof(this->frontRight);
      union {
        int32_t real;
        uint32_t base;
      } u_backLeft;
      u_backLeft.base = 0;
      u_backLeft.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_backLeft.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_backLeft.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_backLeft.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->backLeft = u_backLeft.real;
      offset += sizeof(this->backLeft);
      union {
        int32_t real;
        uint32_t base;
      } u_backMiddle;
      u_backMiddle.base = 0;
      u_backMiddle.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_backMiddle.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_backMiddle.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_backMiddle.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->backMiddle = u_backMiddle.real;
      offset += sizeof(this->backMiddle);
      union {
        int32_t real;
        uint32_t base;
      } u_backRight;
      u_backRight.base = 0;
      u_backRight.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_backRight.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_backRight.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_backRight.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->backRight = u_backRight.real;
      offset += sizeof(this->backRight);
     return offset;
    }

    const char * getType(){ return "sub_message/arduino_msg"; };
    const char * getMD5(){ return "bfea4772612819b51cf19b229d824ca0"; };

  };

}
#endif