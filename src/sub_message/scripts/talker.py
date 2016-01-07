#!/usr/bin/env python

import rospy
import sys
import datetime
from std_msgs.msg import String
from sub_message.srv import *

def talker(opperations,direction,distance,sent_time):
   rospy.wait_for_service('modify_message_stack')
   print("fire")
   try:
       pass_message  = rospy.ServiceProxy('modify_message_stack', SubMessage)
       print("Fire2")
       responce = pass_message(opperations,direction,distance,sent_time)
       return responce.responce
   except rospy.ServiceException, e:
       print "Service call failed: %s"%e

def usage():
   return "Format Opperation Direction Distance"

if __name__ == "__main__":
   rospy.init_node('Time', anonymous=True)
   opperation = ""
   direction = ""
   distance = 0
   #sent_time = rospy.Time()
   sent_time = rospy.Time.now()
   if len(sys.argv) >= 1:
       opperation = sys.argv[1]
       direction = sys.argv[2]
       distance = int(sys.argv[3])
       #message = "".join(sys.argv[1:])
   else:
       print usage()
       sys.exit(1)
   print "Sending Command"
   print (opperation,direction,distance,sent_time)
   print talker(opperation,direction,distance,sent_time)
