#!/usr/bin/env python

import rospy
import time
from std_msgs.msg import String
from sub_message.srv import *
from sub_message.msg import arduino_msg

message = "stop 0 0 0 0"
new_message = "stop 0 0 0 0"

publish = "0"
motor_disabled_dict = {
    'xLeft' : False,
    'xRight' : False,
    'yFront' : False,
    'yBack' : False,
    'zTop' : False,
    'zBottom' : False,
}

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
    global motor_disabled_dict
    msg = arduino_msg()
    no_value = 90

    if(not motor_disabled_dict["xLeft"]):
        msg.xLeft = int(xLeft)
    else:  
        msg.xLeft = no_value

    if(not motor_disabled_dict["xRight"]):
        msg.xRight = int(xRight)
    else:  
        msg.xRight = no_value

    if(not motor_disabled_dict["yFront"]):
        msg.yFront = int(yFront)
    else:  
        msg.yFront = no_value

    if(not motor_disabled_dict["yBack"]):
        msg.yBack = int(yBack)
    else:  
        msg.yBack = no_value

    if(not motor_disabled_dict["zTop"]):
        msg.zTop = int(zTop)
    else:  
        msg.zTop = no_value

    if(not motor_disabled_dict["zBottom"]):
        msg.zBottom = int(zBottom)
    else:  
        msg.zBottom = no_value

    return msg

def disable_motor(msg):
    global motor_disabled_dict

    motor_disabled_dict["xLeft"] = msg.xLeft
    motor_disabled_dict["xRight"] = msg.xRight
    motor_disabled_dict["yFront"] = msg.yFront
    motor_disabled_dict["yBack"] = msg.yBack
    motor_disabled_dict["zTop"] = msg.zTop
    motor_disabled_dict["zBottom"] = msg.zBottom

    return "Motors Disabled"

def looper():
    rospy.init_node('commander', anonymous=True)
    pub = rospy.Publisher("arduino_move", arduino_msg, queue_size=10)
    sub = rospy.Subscriber("commander",String, callback)
    
    motor_disable_service = rospy.Service("motor_disable", MotorDisable, disable_motor)
    rate = rospy.Rate(1)
    publish = arduino_msg()
    global new_message
    global message

    current_time = time.time()
    while not rospy.is_shutdown():
        #print(message + " " + new_message)

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
            elif(command[0] == "rott"):
                publish = createMsg(int(command[1]),180-int(command[1]),
                                    int(command[2]),180-int(command[2]),
                                    int(command[3]),180-int(command[3]))
            elif ( command[0] == "stop" or command[0] == "pause"):
                publish = createMsg(0,0,0,0,0,0)
        
        #Publish 'Next' command To advance the queue
        #If the time is passed the duration
        split_message = message.split()
        if(time.time()-current_time >= float(split_message[4])):
            if(split_message[0] == "movt" or 
                        split_message[0] == "rott" or
                        split_message[0] == "pause"):
                talker("next",0,0,0,0)

        #Publish the command to the motors 
        pub.publish(publish)
        rate.sleep()


if __name__ == '__main__':
    looper()
