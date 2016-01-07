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
    def __init__(self,opperation,direction,distance,sent_time):
        self.opperation = opperation
        self.direction = direction
        self.distance = distance
        self.sent_time = sent_time
        self.received_time = rospy.Time.now()
    def __repr__(self):
        return self.opperation

message_queue = Queue.PriorityQueue()

def modify_sub_message_queue(req):
    opp = opperation(req.opperation,req.direction,req.distance,req.sent_time)
    #opp.opperation = req.opperation
    #opp.direction = req.direction
    #opp.distance = req.distance
    #opp.sent_time = req.sent_time
    #pp.received_time = datetime.now()
    message_queue.put(opp)
    print(message_queue.queue)
    return "Done"

def listener():
    rospy.init_node('sub_listen', anonymous=True)
    service = rospy.Service("modify_message_stack", SubMessage, modify_sub_message_queue)
    print("Init")
    rospy.spin()

if __name__ == '__main__':
    #rospy.init_node('Time', anonymous=True)
    listener()
