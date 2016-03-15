#!/usr/bin/env python

import rospy
import time
from std_msgs.msg import String
from sub_message.srv import *
from sub_message.msg import arduino_msg

message = "stop 0 0 0 0"
new_message = "stop 0 0 0 0"

publish = "0"

def callback (data):
    global new_message
    new_message = data.data
    
def talker(command,x,y,z,t):
   rospy.wait_for_service('modify_message_stack')
   try:
       pass_message  = rospy.ServiceProxy('modify_message_stack', SubMessage)
       responce = pass_message(command,x,y,z,t)
   except rospy.ServiceException, e:
       print "Service call failed: %s"%e

def createMsg(xLeft,xRight,yFront,yBack,zTop,zBottom):
    msg = arduino_msg()
    msg.xLeft = int(xLeft)
    msg.xRight = int(xRight)
    msg.yFront = int(yFront)
    msg.yBack = int(yBack)
    msg.zTop = int(zTop)
    msg.zBottom = int(zBottom)
    return msg

def looper():
    rospy.init_node('commander', anonymous=True)
    pub = rospy.Publisher("arduino_move", arduino_msg, queue_size=10)
    sub = rospy.Subscriber("commander",String, callback)
    rate = rospy.Rate(1)
    publish = arduino_msg()
    global new_message
    global message

    current_time = time.time()
    while not rospy.is_shutdown():
        print(message + " " + new_message)

	#If the message has changed, 
        #update the message passed to the arduino
        if(new_message != message):
            current_time = time.time()
            message = new_message
            command = message.split()
            if(command[0] == "movt"):
                publish = createMsg(command[1],command[1],
                                    command[2],command[2],
                                    command[3],command[3])
            elif ( command[0] == "stop" or command[0] == "pause"):
                publish = createMsg(0,0,0,0,0,0)
            #rospy.loginfo(command)
            #pub.publish(command)
        
        #Publish 'Next' command To advance the queue
        #If the time is passed the duration
	split_message = message.split()
        if(time.time()-current_time >= float(split_message[4])):
            if(split_message[0] == "movt" or split_message[0] == "pause"):
                talker("next",0,0,0,0)

        #Publish the command to the motors 
        pub.publish(publish)
        rate.sleep()


if __name__ == '__main__':
    looper()
