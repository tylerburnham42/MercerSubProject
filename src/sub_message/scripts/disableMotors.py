#!/usr/bin/env python

import rospy
import sys
import datetime
from std_msgs.msg import String
from sub_message.srv import *

def disable_service(xLeft,xRight,yFront,yBack,zTop,zBottom):
    rospy.wait_for_service("motor_disable")
    try:
        pass_message  = rospy.ServiceProxy('motor_disable', MotorDisable)
        return pass_message(xLeft,xRight,yFront,yBack,zTop,zBottom)
    except rospy.ServiceException, e:
        print "Service call failed: %s"%e

def usage():
    return "Input a 1 or a 0 for each of the following:\nxLeft xRight yFront yBack zTop zBottom\nExample 0 0 1 0 1 0"
   

if __name__ == "__main__":
    rospy.init_node('DisableMotorsHelper', anonymous=True)

    if len(sys.argv) != 7:
        print usage()
        sys.exit(1)

    
    xLeft = bool(int(sys.argv[1]))
    xRight = bool(int(sys.argv[2]))
    yFront = bool(int(sys.argv[3]))
    yBack = bool(int(sys.argv[4]))
    zTop = bool(int(sys.argv[5]))
    zBottom = bool(int(sys.argv[6]))
    
    print(disable_service(xLeft,xRight,yFront,yBack,zTop,zBottom))
