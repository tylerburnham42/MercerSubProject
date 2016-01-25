/* 
 * rosserial Subscriber Example
 * Blinks an LED on callback
 */

#include <ros.h>
#include <std_msgs/String.h>

ros::NodeHandle  nh;

void messageCb( const std_msgs::String& sub_message){
  String message =  String(sub_message.data);
  if(message == "ON")
  {
    digitalWrite(13, HIGH);
  }
  else if(message == "OFF")
  {
    digitalWrite(13, LOW);
  }
}

ros::Subscriber<std_msgs::String> sub("arduino_move", &messageCb );

void setup()
{ 
  pinMode(13, OUTPUT);
  nh.initNode();
  nh.subscribe(sub);
}

void loop()
{  
  nh.spinOnce();
  delay(1);
}

