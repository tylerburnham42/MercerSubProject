#include <ros.h>
#include <std_msgs/String.h>
#include <Servo.h>
#include<sub_message/arduino_msg.h>
ros::NodeHandle nh;


std_msgs::String str_msg;
ros::Publisher chatter("arduino_publish", &str_msg);
char charBuf[50];

Servo xLeftServo;
Servo xRightServo;
Servo yFrontServo;
Servo yBackServo;
Servo zTopServo;
Servo zBottomServo;

void messageCb( const sub_message::arduino_msg& sub_message){
  String message = String(sub_message.yBack);

  xLeftServo.write(sub_message.xLeft);
  xRightServo.write(sub_message.xRight);
  yFrontServo.write(sub_message.yFront);
  yBackServo.write(sub_message.yBack);
  zTopServo.write(sub_message.zTop);
  zBottomServo.write(sub_message.zBottom);
  
  //Write what it recieved    
  String(message).toCharArray(charBuf,50);
  str_msg.data = charBuf;
}

ros::Subscriber<sub_message::arduino_msg> sub("arduino_move", &messageCb );

void setup()
{ 
  xLeftServo.attach(2);
  xRightServo.attach(8);
  yFrontServo.attach(13);
  yBackServo.attach(7);
  zTopServo.attach(12);
  zBottomServo.attach(4);
  
  nh.initNode();
  nh.subscribe(sub);
  nh.advertise(chatter);
}

void loop()
{  
  chatter.publish( &str_msg );
  nh.spinOnce();
  delay(1);
}
