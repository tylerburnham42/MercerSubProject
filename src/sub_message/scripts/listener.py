#!/usr/bin/env python

import rospy
import Queue
import datetime
from std_msgs.msg import String
from sub_message.srv import *


class operation():
    def __init__(self,command,x,y,z,t):
        self.command = command
        self.x = x
        self.y = y
        self.z = z
        self.t = t
        #self.sent_time = sent_time
        #self.received_time = rospy.Time.now()
    def __repr__(self):
        return (str(self.command) + " "  
              + str(self.x)+ " " 
              + str(self.y) + " " 
              + str(self.z) + " " 
              + str(self.t) )

message_list = []
current = str(operation("stop",0,0,0,0))

def modify_sub_message_queue(req):
    global message_list
    global current
    opp = operation(req.command,req.x,req.y,req.z,req.t)
    if(opp.command == "clear"):
        while len(message_list) > 0: 
            message_list.pop()
            current = str(operation("stop",0,0,0,0))
    elif(opp.command == "next"):
        if( len(message_list) >= 1):
            opp  = message_list.pop(0)
            current = str(opp)
        else:
            current = str(operation("stop",0,0,0,0))
    else:
        message_list.append(opp)
    print(message_list)
    return str(message_list)

def looper():
    global current
    rospy.init_node('sub_listen', anonymous=True)
    listen_service = rospy.Service("modify_message_stack", SubMessage, modify_sub_message_queue)
    pub = rospy.Publisher("commander", String, queue_size=10)
    rate = rospy.Rate(10)
    while not rospy.is_shutdown():
        pub.publish(current)
        rate.sleep()

if __name__ == '__main__':
    looper()
