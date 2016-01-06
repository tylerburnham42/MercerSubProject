#!/usr/bin/env python

import rospy
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

def modify_sub_message_stack(req):
    print(req.message)
    return "Done"

def listener():
    rospy.init_node('sub_listen', anonymous=True)
    service = rospy.Service("modify_message_stack", SubMessage, modify_sub_message_stack)
    print("Fire")
    rospy.spin()

if __name__ == '__main__':
    listener()
