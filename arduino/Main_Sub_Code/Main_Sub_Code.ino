//#define USB_CON
//----------Includes---------------


#include <ros.h>
#include <std_msgs/String.h>
#include <Servo.h>
#include<sub_message/arduino_msg.h>
ros::NodeHandle nh;



std_msgs::String str_msg;
ros::Publisher general_publisher("arduino_general", &str_msg);
char charBuf[50];

std_msgs::String acc_msg;
ros::Publisher accelerometer_publisher("arduino_accelerometer", &acc_msg);
char accelerometerBuf[50];


Servo xLeftServo;
Servo xRightServo;
Servo yFrontServo;
Servo yBackServo;
Servo zTopServo;
Servo zBottomServo;

void readMotorCommands( const sub_message::arduino_msg& sub_message){
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

ros::Subscriber<sub_message::arduino_msg> sub("arduino_move", &readMotorCommands);

void rosInit()
{
  nh.getHardware()->setBaud(57600);
  //nh.getHardware()->setBaud(115200);  
  
  nh.initNode();
  nh.subscribe(sub);

  nh.advertise(general_publisher);
  nh.advertise(accelerometer_publisher); 
}

void servoInit()
{
  xLeftServo.attach(2);
  xRightServo.attach(8);
  yFrontServo.attach(13);
  yBackServo.attach(7);
  zTopServo.attach(12);
  zBottomServo.attach(4); 
}

void publishMessages()
{
  general_publisher.publish( &str_msg );
  accelerometer_publisher.publish( &acc_msg );
  nh.spinOnce();  
}

void setup()
{ 
  //setup_accelerometer(); 
  rosInit();
  
}

void loop()
{  
  publishMessages();
  //loop_accelerometer();
  delay(1);
}
