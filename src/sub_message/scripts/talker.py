#!/usr/bin/env python

import rospy
import sys
from std_msgs.msg import String
from sub_message.srv import *

def talker(message):
   rospy.wait_for_service('modify_message_stack')
   try:
       pass_message  = rospy.ServiceProxy('modify_message_stack', SubMessage)
       responce = pass_message(message)
       return responce.responce
   except rospy.ServiceException, e:
       print "Service call failed: %s"%e

def usage():
   return "Please Type the Command"

if __name__ == "__main__":
   if len(sys.argv) >= 1:
       message = "".join(sys.argv[1:])
   else:
       print usage()
       sys.exit(1)
   print "Sending Command"
   print talker(message)
