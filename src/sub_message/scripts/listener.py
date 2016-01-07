#!/usr/bin/env python

import rospy
import collections
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

class sub_message():
    def __init__(self,opperation,direction,distance,sent_time):
        self.opperation = opperation
        self.direction = direction
        self.distance = distance
        self.sent_time = sent_time
        self.received_time = received_time

message_queue = collections.deque()

def modify_sub_message_queue(req):
    message = sub_message()
    message.opperation = req.opperation
    message.direction = req.direction
    message.distance = req.distance
    message.sent_time = req.sent_time
    message.received_time = datetime.now()
    message_queue.extend(message)
    print(message_queue)
    return "Done"

def listener():
    rospy.init_node('sub_listen', anonymous=True)
    service = rospy.Service("modify_message_stack", SubMessage, modify_sub_message_queue)
    print("Init")
    rospy.spin()

if __name__ == '__main__':
    listener()
