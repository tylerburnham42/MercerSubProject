#!/usr/bin/env python

import rospy
import sys
import datetime
from std_msgs.msg import String
from sub_message.srv import *

def talker(command,x,y,z,t):
   rospy.wait_for_service('modify_message_stack')
   try:
       pass_message  = rospy.ServiceProxy('modify_message_stack', SubMessage)
       responce = pass_message(command,x,y,z,t)
       return responce.responce
   except rospy.ServiceException, e:
       print "Service call failed: %s"%e

def usage():
   return "Format Opperation Direction Distance"

def ConvertPercentThrust(percent):
   if abs(percent) > 100:
      return -1 # error value
   elif percent > 0:
      min_forward_thrust = 110
      max_forward_thrust = 180
      diff = max_forward_thrust - min_forward_thrust
      return int(percent * diff + min_forward_thrust)
   else:
      min_reverse_thrust = 0
      max_reverse_thrust = 80
      diff = max_reverse_thrust - min_reverse_thrust
      return int((-percent) * diff + min_forward_thrust)
   

if __name__ == "__main__":
   rospy.init_node('Time', anonymous=True)
   command = ""
   x = 0
   y = 0
   z = 0
   t = 0
   sent_time = rospy.Time.now()
   if len(sys.argv) >= 1:
       line = " ".join(sys.argv[1:])
   else:
       print usage()
       sys.exit(1)

   arr = line.replace(",","").split(" ")
   if(arr[0] == "movt"):
       command = arr[0]
       x = ConvertPercentThrust(arr[1])
       y = ConvertPercentThrust(arr[2])
       z = ConvertPercentThrust(arr[3])
       t = arr[4] #passed as an absolute value
   elif(arr[0] == "movd"):
       command = arr[0]
       x = int(arr[1])
       y = int(arr[2])
       z = int(arr[3])
   elif(arr[0] == "clear"):
       command = arr[0]
   elif(arr[0] == "stop"):
       command = arr[0]
   elif(arr[0] == "next"):
       command = arr[0]

   if(command == ""):
       print usage()
       sys.exit(1)

   print (command,x,y,z,t)
   print talker(command,x,y,z,t)
