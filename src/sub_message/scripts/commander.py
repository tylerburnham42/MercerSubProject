#!/usr/bin/env python

import rospy
from std_msgs.msg import String
from sub_message.srv import *

command = ""
new_command = ""

def callback (data):
    global new_command
    new_command = data.data
    


def looper():
    rospy.init_node('commander', anonymous=True)
    pub = rospy.Publisher("arduino_move", String, queue_size=10)
    sub = rospy.Subscriber("commander",String, callback)
    rate = rospy.Rate(5) 
    global command
    global new_command
    while not rospy.is_shutdown():
        print(command + " " + new_command)
        if(new_command != command):
            command = new_command
            rospy.loginfo(command)
            pub.publish(command)
        rate.sleep()


if __name__ == '__main__':
    looper()
