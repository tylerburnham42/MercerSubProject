#include <SPI.h>


/*
 TEAM AQUABOT CONTROL SYSTEM
 Tested with Arduino Uno
 */
// X axis pointing forward
// Y axis pointing to the right 
// and Z axis pointing down.
// Positive pitch : nose up
// Positive roll : right wing down
// Positive yaw : clockwise
//Correct directions x,y,z - gyro, accelerometer, magnetometer
int SENSOR_SIGN[9] = { 1,1,1,-1,- 1,-1,1,1,1};
#include <Wire.h>;
#include <Servo.h>;
// LSM303 accelerometer: set to full 8 g sensitivity
// 3.8 mg/digit; 1 g = 256
#define GRAVITY 256  //this equivalent to 1G in the raw data coming from the accelerometer
#define ToRad(x) ((x)*0.01745329252)  // *pi/180
#define ToDeg(x) ((x)*57.2957795131)  // *180/pi
// L3G4200D gyro: 2000 dps full scale
// 70 mdps/digit; 1 dps = 0.07
#define Gyro_Gain_X 0.07 //X axis Gyro gain
#define Gyro_Gain_Y 0.07 //Y axis Gyro gain
#define Gyro_Gain_Z 0.07 //Z axis Gyro gain
#define Gyro_Scaled_X(x) ((x)*ToRad(Gyro_Gain_X)) //Return the scaled ADC raw data of the gyro in radians for second
#define Gyro_Scaled_Y(x) ((x)*ToRad(Gyro_Gain_Y)) //Return the scaled ADC raw data of the gyro in radians for second
#define Gyro_Scaled_Z(x) ((x)*ToRad(Gyro_Gain_Z)) //Return the scaled ADC raw data of the gyro in radians for second
// LSM303 magnetometer calibration constants
// use Pololu LSM303 library to find the right values
// newest calibration
//M min X: -204 Y: - 295 Z: 120 M max X: 264 Y: 250 Z: 334
#define M_X_MIN -204
#define M_Y_MIN -318
#define M_Z_MIN 120
#define M_X_MAX 264
#define M_Y_MAX 250
#define M_Z_MAX 335
#define Kp_ROLLPITCH 0.02
#define Ki_ROLLPITCH 0.00002
#define Kp_YAW 1.2
#define Ki_YAW 0.00002

/*For debugging purposes*/
//OUTPUTMODE=1 will print the corrected data, 
//OUTPUTMODE=0 will print uncorrected data of the gyros (with drift)
#define OUTPUTMODE 1
//#define PRINT_DCM 0     //Will print the whole direction cosine matrix
#define PRINT_ANALOGS 0 //Will print the analog raw data
#define PRINT_EULER 1   //Will print the Euler angles Roll, Pitch and Yaw
//constants
Servo ESC_LEFT_HORIZ;
Servo ESC_RIGHT_HORIZ;
Servo ESC_LEFT_FRONT_VERT;
Servo ESC_LEFT_BACK_VERT;
Servo ESC_RIGHT_FRONT_VERT;
Servo ESC_RIGHT_BACK_VERT;
//pin assignments
int ESC_LEFT_HORIZ_PIN=5;
int ESC_LEFT_FRONT_VERT_PIN=6;
int ESC_LEFT_BACK_VERT_PIN=7;
int ESC_RIGHT_HORIZ_PIN=8;
int ESC_RIGHT_FRONT_VERT_PIN=9;
int ESC_RIGHT_BACK_VERT_PIN=10;
//pin assingment - light enable
int lightPin=3;
boolean lightEnable=false;
int waterdetectpin = 0;
//may need tweaking
//depended on ESC setting
int LF_STOP = 96;
int STOP_MOTOR = 93;
int TURNING_SPEED=25;
int FORWARD_SPEED_INCREMENT=5;
int SPEED_INCREMENT=2;
int SPEED_ADJUSTMENT=1;
int SPEED_DECREASE=1;
int waterlevel=0;
int state = 'n';
int lastError =0;
float G_Dt=0.02; // Integration time (DCM algorithm) We will run the
              //integration loop at 50Hz if possible
long timer=0; //general purpuse timer
long timer_old;
long timer24=0; //Second timer used to print values
int AN[6]; //array that stores the gyro and accelerometer data
int AN_OFFSET[6]={0,0,0,0,0,0}; //Array that stores the Offset of the sensors
int gyro_x;
int gyro_y;
int gyro_z;
int accel_x;
int accel_y;
int accel_z;
int magnetom_x;
int magnetom_y;
int magnetom_z;
float c_magnetom_x;
float c_magnetom_y;
float c_magnetom_z;
float MAG_Heading;
float Accel_Vector[3]= {0,0,0}; //Store the acceleration in a vector
float Gyro_Vector[3]= {0,0,0};//Store the gyros turn rate in a vector
float Omega_Vector[3]= {0,0,0}; //Corrected Gyro_Vector data
float Omega_P[3]= {0,0,0};//Omega Proportional correction
float Omega_I[3]= {0,0,0};//Omega Integrator
float Omega[3]= {0,0,0};
// Euler angles
float roll;
float pitch;
float yaw;
float errorRollPitch[3]= {0,0,0}; 
float errorYaw[3]= {0,0,0};
unsigned int counter=0;
byte gyro_sat=0;
float DCM_Matrix[3][3]= {
  {1,0,0}
 ,{0,1,0}
 ,{0,0,1}
}; 
float Update_Matrix[3][3]={
  {0,1,2}
 ,{3,4,5}
 ,{6,7,8}
}; //Gyros here

float Temporary_Matrix[3][3]={
  {0,0,0}
 ,{0,0,0}
 ,{0,0,0}
};

void setup()
{ 
  //led on
  pinMode(lightPin, OUTPUT);
  digitalWrite (lightPin, HIGH);
  Serial.begin(115200);
  ESC_LEFT_HORIZ.attach(ESC_LEFT_HORIZ_PIN,1000,2000);
  ESC_RIGHT_HORIZ.attach(ESC_RIGHT_HORIZ_PIN,1000,2000);
  ESC_LEFT_FRONT_VERT.attach(ESC_LEFT_FRONT_VERT_PIN,1000,2000);
  ESC_RIGHT_FRONT_VERT.attach(ESC_RIGHT_FRONT_VERT_PIN,1000,2000);
  ESC_LEFT_BACK_VERT.attach(ESC_LEFT_BACK_VERT_PIN,1000,2000);
  ESC_RIGHT_BACK_VERT.attach(ESC_RIGHT_BACK_VERT_PIN,1000,2000);
  stopALL();
  detectWater();
  
  Serial.println("TEAM AQUABOT CONTROL SYSTEM");
  Serial.println("Please Place Submarine on Flat Surface");
  delay(1000);
  I2C_Init(); 
  delay(2000);
  Accel_Init();
  Compass_Init();
  Gyro_Init();
  delay(20);
  for(int i=0;i<32;i++) // We take some readings...
  {
    Read_Gyro();
    Read_Accel();
    for(int y=0; y<6; y++) // Cumulate values
      AN_OFFSET[y] += AN[y];
    delay(20);
  }
  for(int y=0; y<6; y++)
    AN_OFFSET[y] = AN_OFFSET[y]/32;
  AN_OFFSET[5]-=GRAVITY*SENSOR_SIGN[5];
  //Serial.println("Offset:");
  for(int y=0; y<6; y++)
    Serial.println(AN_OFFSET[y]);
  delay(1000);
  digitalWrite (lightPin, LOW);
  Serial.println("WELCOME TO THE AQUA-BOT!");
  Serial.println("ENTER A COMMAND:");
  Serial.println("KEYBOARD:");
  Serial.println("A - Ascend");
  Serial.println("D - Descend");
  Serial.println("F - Forward");
  Serial.println("B - Backward");
  Serial.println("S - Stop");
  Serial.println("I - Toggle Lights");
  Serial.println("R - Rotate Right");
  Serial.println("L - Rotate Left");
  Serial.println("T - Tilt Down");
  Serial.println("G - Tilt Up");
  delay(2000);
  timer=millis();
  delay(20);
  counter=0;
}
int go_l;
int go_r;
char key;
void loop() //Main Loop
{
  while (Serial.available())
  {
    delay(1);
    key = (char)Serial.read();
    switch(key)
    {
      case ('d'):
      descend();
      break;
      case ('a'):
      ascend();
      break;
      case ('f'):
      forward();
      break;
      case ('b'):
      backward();
      break;
      case ('r'):
      turnRight();
      break;
      case ('l'):
      turnLeft();
      break;

      case ('i'):
      toggleLights();
      break;
      case ('s'):
      stopALL();
      break;
      
      case ('t'):
      tiltUp();
      break;
   
      case ('g'):
      tiltDown();
      break;
      
    }
  } 
if((millis()-timer)>=20) // Main loop runs at 50Hz
  {
    counter++;
    timer_old = timer;
    timer=millis();
    if (timer>timer_old)
      G_Dt = (timer-timer_old)/1000.0;    // Real time of loop run. We use
                                         //this on the DCM algorithm (gyro integration time)
    else
      G_Dt = 0;
    // *** DCM algorithm
    // Data adquisition
    Read_Gyro();   // This read gyro data
    Read_Accel();     // Read I2C accelerometer
    if (counter > 5) // Read compass data at 10Hz... (5 loop runs)
    {
      counter=0;
      Read_Compass();    // Read I2C magnetometer
      Compass_Heading(); // Calculate magnetic heading
    }
    // Calculations...
    Matrix_update(); 
    Normalize();
    Drift_correction();
    Euler_angles();
    // ***
    printdata();
  }
}
void forward()
{ 
  if (state == 'f')
  {
    go_l = go_l + FORWARD_SPEED_INCREMENT;

    go_r = go_r + FORWARD_SPEED_INCREMENT;
//    ESC_LEFT_FRONT_VERT.write(LF_STOP);
 // ESC_RIGHT_FRONT_VERT.write(STOP_MOTOR);
 // ESC_LEFT_BACK_VERT.write(STOP_MOTOR);
//    ESC_RIGHT_BACK_VERT.write(STOP_MOTOR);
    ESC_LEFT_HORIZ.write(go_l);
    ESC_RIGHT_HORIZ.write(go_r);
  }
  else
  { 
    go_l=111;
    go_r=113;
//    ESC_LEFT_FRONT_VERT.write(LF_STOP);
//    ESC_RIGHT_FRONT_VERT.write(STOP_MOTOR);
//    ESC_LEFT_BACK_VERT.write(STOP_MOTOR);
//    ESC_RIGHT_BACK_VERT.write(STOP_MOTOR);
    ESC_LEFT_HORIZ.write(go_l);
    ESC_RIGHT_HORIZ.write(go_r);
    state = 'f';
  }
}
void backward()
{
  if (state == 'b')
  {
    go_l = go_l - FORWARD_SPEED_INCREMENT;
    go_r = go_r - FORWARD_SPEED_INCREMENT;
//    ESC_LEFT_FRONT_VERT.write(LF_STOP);
//    ESC_RIGHT_FRONT_VERT.write(STOP_MOTOR);
//    ESC_LEFT_BACK_VERT.write(STOP_MOTOR);
//    ESC_RIGHT_BACK_VERT.write(STOP_MOTOR);
    ESC_LEFT_HORIZ.write(go_l);
    ESC_RIGHT_HORIZ.write(go_r);
  }
  else
  {
    go_l=78;
    go_r=81;
//    ESC_LEFT_FRONT_VERT.write(LF_STOP);
//    ESC_RIGHT_FRONT_VERT.write(STOP_MOTOR);
//    ESC_LEFT_BACK_VERT.write(STOP_MOTOR);
//    ESC_RIGHT_BACK_VERT.write(STOP_MOTOR);
    ESC_LEFT_HORIZ.write(go_l);
    ESC_RIGHT_HORIZ.write(go_r);
    state = 'b';
  }
}
//descend function
//subsequent calls increase power by XX%
void descend()
{ 
  if (state == 'd')
  {
    ESC_LEFT_FRONT_VERT.write(117);
    ESC_RIGHT_FRONT_VERT.write(115);
    ESC_LEFT_BACK_VERT.write(115);
    ESC_RIGHT_BACK_VERT.write(115);
    ESC_LEFT_HORIZ.write(STOP_MOTOR);
    ESC_RIGHT_HORIZ.write(STOP_MOTOR);
  }
  else
  {
    ESC_LEFT_FRONT_VERT.write(107);
    ESC_RIGHT_FRONT_VERT.write(105);
    ESC_LEFT_BACK_VERT.write(105);
    ESC_RIGHT_BACK_VERT.write(105);
    ESC_LEFT_HORIZ.write(STOP_MOTOR);
    ESC_RIGHT_HORIZ.write(STOP_MOTOR);
    state ='d';
  }
}
//ascend function
//subsequent calls increase power by XX%
void ascend()
{
//  if (state = 'd')
//  {
//    reverseDirection_VERTICAL();
//  }
  if (state=='a')
  {
    ESC_LEFT_FRONT_VERT.write(73);
    ESC_RIGHT_FRONT_VERT.write(70);
    ESC_LEFT_BACK_VERT.write(72);
    ESC_RIGHT_BACK_VERT.write(73);
    ESC_LEFT_HORIZ.write(STOP_MOTOR);
    ESC_RIGHT_HORIZ.write(STOP_MOTOR);
  } 
  else
  { 
    ESC_LEFT_FRONT_VERT.write(83);
    ESC_RIGHT_FRONT_VERT.write(80);
    ESC_LEFT_BACK_VERT.write(82);
    ESC_RIGHT_BACK_VERT.write(83);
    ESC_LEFT_HORIZ.write(STOP_MOTOR);
    ESC_RIGHT_HORIZ.write(STOP_MOTOR);
    state = 'a';
  }
}
//turn right
void turnRight()
{
  if (state=='r')
  {
    ESC_LEFT_HORIZ.write(120);
    ESC_RIGHT_HORIZ.write(82);
  }
  else

  {
    //stopVertical();
    ESC_LEFT_HORIZ.write(110);
    ESC_RIGHT_HORIZ.write(82);
    state='r';
  }
}
//turn left
void turnLeft()
{
  if (state=='l')
  {
    ESC_LEFT_HORIZ.write(82);
    ESC_RIGHT_HORIZ.write(120);
  }
  else
  {
    //stopVertical();
    ESC_LEFT_HORIZ.write(82);
    ESC_RIGHT_HORIZ.write(110);
    state='l';
  }
}
//stop all motors
void stopALL()
{
  //Serial.println("STOPPING ALL MOTORS!");
  state='n';
  go_l=113;
  go_r=113;
  ESC_LEFT_HORIZ.write(STOP_MOTOR);
  ESC_RIGHT_HORIZ.write(STOP_MOTOR);
  ESC_LEFT_FRONT_VERT.write(LF_STOP);
  ESC_RIGHT_FRONT_VERT.write(STOP_MOTOR);
  ESC_LEFT_BACK_VERT.write(STOP_MOTOR);
  ESC_RIGHT_BACK_VERT.write(STOP_MOTOR);
}
void stopVertical()
{
  //Serial.println("STOPPING VERT MOTORS!");
  ESC_LEFT_FRONT_VERT.write(LF_STOP);
  ESC_RIGHT_FRONT_VERT.write(STOP_MOTOR);
  ESC_LEFT_BACK_VERT.write(STOP_MOTOR);
  ESC_RIGHT_BACK_VERT.write(STOP_MOTOR);
}
void tiltUp()
{
  ESC_LEFT_HORIZ.write(STOP_MOTOR);
  ESC_RIGHT_HORIZ.write(STOP_MOTOR);
  ESC_LEFT_FRONT_VERT.write(70);
  ESC_RIGHT_FRONT_VERT.write(70);
  ESC_LEFT_BACK_VERT.write(STOP_MOTOR);
  ESC_RIGHT_BACK_VERT.write(STOP_MOTOR);
}
void tiltDown()
{
  ESC_LEFT_HORIZ.write(STOP_MOTOR);
  ESC_RIGHT_HORIZ.write(STOP_MOTOR);
  ESC_LEFT_FRONT_VERT.write(115);
  ESC_RIGHT_FRONT_VERT.write(115);
  ESC_LEFT_BACK_VERT.write(STOP_MOTOR);
  ESC_RIGHT_BACK_VERT.write(STOP_MOTOR);
}
void display(String event)
{
  Serial.println("!EVENT, ");
  Serial.print(event);
} 
void toggleLights()
{ 
  switch(lightEnable)
  {
    case(true):
    {
      //Serial.println("LIGHTS OFF!");
      analogWrite(lightPin,0);
      lightEnable=false;
      break;
    }
    case(false):
    {
      //Serial.println("LIGHTS ON!");
      digitalWrite(lightPin,HIGH);
      lightEnable=true;
      break;
    }
  }
}

void detectWater()
{
  waterlevel = analogRead(waterdetectpin); // read the value and send to variable val
  if (waterlevel > 400) // judgment variable val for water detection
  {
    analogWrite (lightPin, HIGH);
    ascend();
  }
  else
  {
  }
  delay(100);
}
