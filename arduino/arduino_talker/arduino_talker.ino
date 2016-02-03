#include <ros.h>
#include <std_msgs/String.h>
#include <Servo.h>

ros::NodeHandle nh;


std_msgs::String str_msg;
ros::Publisher chatter("arduino_publish", &str_msg);
char charBuf[50];

Servo myservo;

void messageCb( const std_msgs::String& sub_message){
  String message = String(sub_message.data);
  myservo.write(message.toInt());
  
  //Write what it recieved    
  String(message).toCharArray(charBuf,50);
  str_msg.data = charBuf;
}

ros::Subscriber<std_msgs::String> sub("arduino_move", &messageCb );

void setup()
{ 
  myservo.attach(8);
  nh.initNode();
  nh.subscribe(sub);
  nh.advertise(chatter);
  str_msg.data = String("Setup").toCharArray(charBuf,50);
}

void loop()
{  
  chatter.publish( &str_msg );
  nh.spinOnce();
  delay(1);
}
