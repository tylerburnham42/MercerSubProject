#include <iostream>
#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>


void ProcessImage();


using namespace cv;
using namespace std;

int iLastX = -1; 
int iLastY = -1;
double LastdArea = -1;

 int main( int argc, char** argv )
 {
  ros::init(argc, argv, "image_listener");
  ros::NodeHandle nh;
  cv::namedWindow("view");
  cv::startWindowThread();
  image_transport::ImageTransport it(nh);
  image_transport::Subscriber sub = it.subscribe("output_video", 1, ProcessImage);
  ros::spin();
  cv::destroyWindow("view");
 }

/*
void imageCallback(const sensor_msgs::ImageConstPtr& msg)
{
  try 
  {
    cv::imshow("view", cv_bridge::toCvShare(msg, "bgr8")->image);
    cv::waitKey(30);
  }
  catch (cv_bridge::Exception& e)
  {
    ROS_ERROR("Could not convert from '%s' to 'bgr8'.", msg->encoding.c_str());
  }
}
*/

 void ProcessImage(const sensor_msgs::ImageConstPtr& msg)
 {
    /*
    VideoCapture cap(0); //capture the video from webcam
    cap.set(CV_CAP_PROP_FPS, 20);

    if ( !cap.isOpened() )  // if not success, exit program
    {
         cout << "Cannot open the web cam" << endl;
         return -1;
    }
    */
    namedWindow("Control", CV_WINDOW_AUTOSIZE); //create a window called "Control"

  int iLowH = 0;
 int iHighH = 10;

  int iLowS = 75; 
 int iHighS = 150;

  int iLowV = 0;
 int iHighV = 255;

  //Create trackbars in "Control" window
 createTrackbar("LowH", "Control", &iLowH, 179); //Hue (0 - 179)
 createTrackbar("HighH", "Control", &iHighH, 179);

  createTrackbar("LowS", "Control", &iLowS, 255); //Saturation (0 - 255)
 createTrackbar("HighS", "Control", &iHighS, 255);

  createTrackbar("LowV", "Control", &iLowV, 255);//Value (0 - 255)
 createTrackbar("HighV", "Control", &iHighV, 255);




//Capture a temporary image from the camera
 Mat imgOriginal = cv_bridge::toCvShare(msg, "bgr8")->image;
 //cap.read(imgTmp); 

  //Create a black image with the size as the camera output
 Mat imgLines = Mat::zeros( imgOriginal.size(), CV_8UC3 );
 
    /*
    while (true)
    {
        Mat imgOriginal;

        bool bSuccess = cap.read(imgOriginal); // read a new frame from video



         if (!bSuccess) //if not success, break loop
        {
             cout << "Cannot read a frame from video stream" << endl;
             break;
        }
    */
    Mat imgHSV;

   cvtColor(imgOriginal, imgHSV, COLOR_BGR2HSV); //Convert the captured frame from BGR to HSV
 
  Mat imgThresholded;

   inRange(imgHSV, Scalar(iLowH, iLowS, iLowV), Scalar(iHighH, iHighS, iHighV), imgThresholded); //Threshold the image
      
  //morphological opening (removes small objects from the foreground)
  erode(imgThresholded, imgThresholded, getStructuringElement(MORPH_ELLIPSE, Size(5, 5)) );
  dilate( imgThresholded, imgThresholded, getStructuringElement(MORPH_ELLIPSE, Size(5, 5)) ); 

   //morphological closing (removes small holes from the foreground)
  dilate( imgThresholded, imgThresholded, getStructuringElement(MORPH_ELLIPSE, Size(5, 5)) ); 
  erode(imgThresholded, imgThresholded, getStructuringElement(MORPH_ELLIPSE, Size(5, 5)) );

   //Calculate the moments of the thresholded image
  Moments oMoments = moments(imgThresholded);

   double dM01 = oMoments.m01;
  double dM10 = oMoments.m10;
  double dArea = oMoments.m00;
   // if the area <= 10000, I consider that the there are no object in the image and it's because of the noise, the area is not zero 
  if (dArea > 10000)
  {
   //calculate the position of the ball
   int posX = dM10 / dArea;
   int posY = dM01 / dArea;        
        
   if (iLastX >= 0 && iLastY >= 0 && posX >= 0 && posY >= 0)
   {
    //Draw a red line from the previous point to the current point
//    line(imgLines, Point(posX, posY), Point(iLastX, iLastY), Scalar(0,0,255), 2);

    int PosErrorMargin = 10; //Pixels
    double AreaErrorMargin = 1.02; //Ratio

    if (posX > iLastX + PosErrorMargin)
    {
      cout << "Moved Right\t";
    }
    else if (posX < iLastX - PosErrorMargin)
    {
      cout << "Moved Left\t";
    }

    if (posY > iLastY + PosErrorMargin)
    {
      cout << "Moved Down\t";
    }
    else if (posY < iLastY - PosErrorMargin)
    {
      cout << "Moved Up\t";
    }

    if (dArea > LastdArea * AreaErrorMargin)
    {
      cout << "Moved Closer\n\n";
    }
    else if (dArea < LastdArea / AreaErrorMargin)
    {
      cout << "Moved Away\n\n";
    }
    else
    {
      cout << "No Distance Change\n\n";
    }

   }
    LastdArea = dArea;
    iLastX = posX;
   iLastY = posY;
  }

   imshow("Thresholded Image", imgThresholded); //show the thresholded image

   imgOriginal = imgOriginal + imgLines;
  imshow("Original", imgOriginal); //show the original image

        if (waitKey(30) == 27) //wait for 'esc' key press for 30ms. If 'esc' key is pressed, break loop
       {
            cout << "esc key is pressed by user" << endl;
            //break; 
       }

//   return 0;
}
