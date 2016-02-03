#include <ros.h>
#include <std_msgs/String.h>

ros::NodeHandle nh;


std_msgs::String str_msg;
ros::Publisher chatter("arduino_publish", &str_msg);
char charBuf[50];

void messageCb( const std_msgs::String& sub_message){
  String message = String(sub_message.data);


  if(message == "ON")
  {
    digitalWrite(8, HIGH);
    
      String("ON Fire!").toCharArray(charBuf,50);
      str_msg.data = charBuf;
  }
  else if(message == "OFF")
  {
    digitalWrite(8, LOW);
    
      String("OFF Fire!").toCharArray(charBuf,50);
      str_msg.data = charBuf;
  }
  else
  {
      String(message).toCharArray(charBuf,50);
      str_msg.data = charBuf;
  }
}

ros::Subscriber<std_msgs::String> sub("arduino_move", &messageCb );

void setup()
{ 
  pinMode(8, OUTPUT);
  digitalWrite(8, HIGH);
  nh.initNode();
  nh.subscribe(sub);
  nh.advertise(chatter);
  char setupMessage[50] = "Setup";
  str_msg.data = setupMessage;
}

void loop()
{  
  chatter.publish( &str_msg );
  nh.spinOnce();
  delay(1);
}
