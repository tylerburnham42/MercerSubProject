#!/usr/bin/env python

import rospy
from std_msgs.msg import String
from sub_message.srv import *

message = ""
new_message = ""

publish = "0"

def callback (data):
    global new_message
    new_message = data.data
    


def looper():
    rospy.init_node('commander', anonymous=True)
    pub = rospy.Publisher("arduino_move", String, queue_size=10)
    sub = rospy.Subscriber("commander",String, callback)
    rate = rospy.Rate(5) 
    global publish
    global new_message
    global message
    while not rospy.is_shutdown():
        print(message + " " + new_message)
        if(new_message != message):
            message = new_message
            command = message.split()
            if(command[0] == "movt"):
                publish = (str(command[1]))
            elif ( command[0] == "stop"):
                publish = "0"
            #rospy.loginfo(command)
            #pub.publish(command)
        pub.publish(publish)
        rate.sleep()


if __name__ == '__main__':
    looper()