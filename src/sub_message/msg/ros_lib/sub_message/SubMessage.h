#ifndef _ROS_SERVICE_SubMessage_h
#define _ROS_SERVICE_SubMessage_h
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace sub_message
{

static const char SUBMESSAGE[] = "sub_message/SubMessage";

  class SubMessageRequest : public ros::Msg
  {
    public:
      const char* command;
      int32_t x;
      int32_t y;
      int32_t z;
      float t;

    SubMessageRequest():
      command(""),
      x(0),
      y(0),
      z(0),
      t(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const
    {
      int offset = 0;
      uint32_t length_command = strlen(this->command);
      memcpy(outbuffer + offset, &length_command, sizeof(uint32_t));
      offset += 4;
      memcpy(outbuffer + offset, this->command, length_command);
      offset += length_command;
      union {
        int32_t real;
        uint32_t base;
      } u_x;
      u_x.real = this->x;
      *(outbuffer + offset + 0) = (u_x.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_x.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_x.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_x.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->x);
      union {
        int32_t real;
        uint32_t base;
      } u_y;
      u_y.real = this->y;
      *(outbuffer + offset + 0) = (u_y.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_y.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_y.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_y.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->y);
      union {
        int32_t real;
        uint32_t base;
      } u_z;
      u_z.real = this->z;
      *(outbuffer + offset + 0) = (u_z.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_z.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_z.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_z.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->z);
      union {
        float real;
        uint32_t base;
      } u_t;
      u_t.real = this->t;
      *(outbuffer + offset + 0) = (u_t.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_t.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_t.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_t.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->t);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer)
    {
      int offset = 0;
      uint32_t length_command;
      memcpy(&length_command, (inbuffer + offset), sizeof(uint32_t));
      offset += 4;
      for(unsigned int k= offset; k< offset+length_command; ++k){
          inbuffer[k-1]=inbuffer[k];
      }
      inbuffer[offset+length_command-1]=0;
      this->command = (char *)(inbuffer + offset-1);
      offset += length_command;
      union {
        int32_t real;
        uint32_t base;
      } u_x;
      u_x.base = 0;
      u_x.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_x.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_x.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_x.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->x = u_x.real;
      offset += sizeof(this->x);
      union {
        int32_t real;
        uint32_t base;
      } u_y;
      u_y.base = 0;
      u_y.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_y.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_y.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_y.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->y = u_y.real;
      offset += sizeof(this->y);
      union {
        int32_t real;
        uint32_t base;
      } u_z;
      u_z.base = 0;
      u_z.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_z.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_z.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_z.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->z = u_z.real;
      offset += sizeof(this->z);
      union {
        float real;
        uint32_t base;
      } u_t;
      u_t.base = 0;
      u_t.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_t.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_t.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_t.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->t = u_t.real;
      offset += sizeof(this->t);
     return offset;
    }

    const char * getType(){ return SUBMESSAGE; };
    const char * getMD5(){ return "0077fff01acf368ae340426c41216d77"; };

  };

  class SubMessageResponse : public ros::Msg
  {
    public:
      const char* responce;

    SubMessageResponse():
      responce("")
    {
    }

    virtual int serialize(unsigned char *outbuffer) const
    {
      int offset = 0;
      uint32_t length_responce = strlen(this->responce);
      memcpy(outbuffer + offset, &length_responce, sizeof(uint32_t));
      offset += 4;
      memcpy(outbuffer + offset, this->responce, length_responce);
      offset += length_responce;
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer)
    {
      int offset = 0;
      uint32_t length_responce;
      memcpy(&length_responce, (inbuffer + offset), sizeof(uint32_t));
      offset += 4;
      for(unsigned int k= offset; k< offset+length_responce; ++k){
          inbuffer[k-1]=inbuffer[k];
      }
      inbuffer[offset+length_responce-1]=0;
      this->responce = (char *)(inbuffer + offset-1);
      offset += length_responce;
     return offset;
    }

    const char * getType(){ return SUBMESSAGE; };
    const char * getMD5(){ return "714ef05653d49e4a68d14ae9ce55ed2f"; };

  };

  class SubMessage {
    public:
    typedef SubMessageRequest Request;
    typedef SubMessageResponse Response;
  };

}
#endif
