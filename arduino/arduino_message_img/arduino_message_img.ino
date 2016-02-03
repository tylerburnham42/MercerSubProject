/* 
 * rosserial Subscriber Example
 * Blinks an LED on callback
 */

#include <ros.h>
#include <std_msgs/String.h>
#include <Servo.h> 


ros::NodeHandle  nh;
Servo myservo;

void messageCb( const std_msgs::String& sub_message){
  String message =  String(sub_message.data);

  if(message == "ON")
  {
    myservo.write(0);
  }
  else if(message == "OFF")
  {
    myservo.write(180);
  }
}

ros::Subscriber<std_msgs::String> sub("arduino_move", &messageCb );

void setup()
{ 
  myservo.attach(8);  // attaches the servo on pin 9 to the servo object 

  nh.initNode();
  nh.subscribe(sub);
}

void loop()
{  
  nh.spinOnce();
  delay(1);
}

