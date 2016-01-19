#!/usr/bin/env python

import rospy
#import collections
import Queue
import datetime
from std_msgs.msg import String
from sub_message.srv import *

#def callback(data):
#    rospy.loginfo(rospy.get_caller_id() + "I heard %s", data.data)

#ef listener():

    # In ROS, nodes are uniquely named. If two nodes with the same
    # node are launched, the previous one is kicked off. The
    # anonymous=True flag means that rospy will choose a unique
    # name for our 'talker' node so that multiple talkers can
    # run simultaneously.
#   rospy.init_node('sub_listen', anonymous=True)

#   rospy.Subscriber("sub_sender", String, callback)

    # spin() simply keeps python from exiting until this node is stopped
   #rospy.spin()

class opperation():
    def __init__(self,command,x,y,z,t,sent_time):
        self.command = command
        self.x = x
        self.y = y
        self.z = z
        self.t = t
        self.sent_time = sent_time
        self.received_time = rospy.Time.now()
    def __repr__(self):
        return self.command

message_list = []

def modify_sub_message_queue(req):
    opp = opperation(req.command,req.x,req.y,req.z,req.t,req.sent_time)
    if(opp.command == "clear"):
        while len(message_list) > 0: 
            message_list.pop()
    elif(opp.command == "skip"):
        message_list.pop(0)
    else:
        message_list.append(opp)
    print(message_list)
    return str(message_list)

def listener():
    rospy.init_node('sub_listen', anonymous=True)
    service = rospy.Service("modify_message_stack", SubMessage, modify_sub_message_queue)
    print("Init")
    rospy.spin()

if __name__ == '__main__':
    listener()
