# Mercer University Semi-Autonomous Sub Project 
This is a repository to host the ROS code that is used to operate the ROV. A team of Tyler Burnham and Andrew Buff worked on the code to change it into ROS in the Spring of 2016. It now operates on a laptop and a Raspberry Pi.  

## Background on the Project
The purpose of this project is to construct a fully autonomous ROV (Remotely Operated Vehicle) that can be used for underwater surveillance. ROVs have the potential to serve a large role in underwater exploration and surveillance. Human undersea exploration and surveillance can be a very dangerous activity. A variety of factors can cause an underwater environment to be dangerous to a human diver, including water pressure, insufficient supply of oxygen, and hostile wildlife. Currently, modern ROVs are being used to provide safer alternatives. ROVs can fit in smaller and more dangerous places that are unsuitable for humans. This project is intended as one of Mercer’s first steps toward an underwater autonomous platform.

## Getting Started
The following is an abbreviated install procedure. See the wiki page for the full procedure. 

### Prerequisities
The following is a list of the software needed to install and run the code. 
1. Laptop - Kubuntu  Trusty (14.04)
2. Raspberry PI 2 - Ubuntu 14.04 LTS for ARM
4. ROS - Jade Turtle
6. Rosserial
7. Rosserial - Version 0.7.1
8. Rosserial_Python - Version 0.7.1
9. Rosserial_Arduino - Version 0.7.1
10. ROS OpenCV - Version 3.1
11. ROS BridgeCV - Version 1.11.12

The following software is not required but was used in the installation and deployment of the code. 
1. SSH Server
2. Vim
3. Arduino IDE

### Installing
See the wiki page for full installation instructions.  
#### Laptop
This project was created and tested on Kubuntu  Trusty (14.04).  
Link to download: http://cdimage.ubuntu.com/kubuntu/releases/14.04/release/  
Installation Guide: https://help.ubuntu.com/community/Installation  
#### Raspberry Pi
This project was created and tested on Ubuntu 14.04 LTS for ARM.  
Link to image download and installation guide: https://wiki.ubuntu.com/ARM/RaspberryPi  
#### Ros Jade
ROS Installation Guide: http://wiki.ros.org/jade/Installation/Ubuntu.   
``` bash
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'  
sudo apt-key adv --keyserver hkp://pool.sks-keyservers.net:80 --recv-key 0xB01FA116  
sudo apt-get update  
sudo apt-get install ros-jade-desktop-full  
sudo rosdep init  
rosdep update  
sudo apt-get install python-rosinstall  
```
#### Ros Serial
Ros Wiki Page: http://wiki.ros.org/rosserial_arduino/Tutorials/Arduino%20IDE%20Setup  
Rosserial GitHub Page: https://github.com/ros-drivers/rosserial  
The software was built and tested on the following versions:
 - Rosserial - Version 0.7.1 (2015-07-06)
 - Rosserial_Python - Version 0.7.1  (2015-07-06)
 - Rosserial_Arduino - Version 0.7.1 (2015-07-06)

sudo apt-get install ros-jade-rosserial
sudo apt-get install ros-jade-rosserial-arduino
``` bash
cd ~/MercerSubProject
catkin_make
catkin_make install
```
#### Install Ros OpenCV
The software was built and tested on the following versions:
 - Version 3.1

To install OpenCV use the following guide.  
http://docs.opencv.org/3.0-last-rst/doc/tutorials/introduction/linux_install/linux_install.html

#### Install Ros Bridge_CV
The software was built and tested on the following versions:  
 - Version 1.11.12

From: http://wiki.ros.org/cv_bridge
``` bash
python <vison_opencv dir>/cv_bridge/setup.py build
python <vison_opencv dir>/image_geometry/setup.py build
```

#### Updating Ros Packages
To update all the ros packages:  
Open a console  
Run the following commands:  
``` bash
sudo apt-get update
sudo apt-get dist-upgrade
```
If asked type “Y” to complete the installation

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

For the versions available, see the [tags on this repository](https://github.com/tylerburnham42/MercerSubProject/tags). 

## Authors

* **Tyler Burnham** - *Initial work* - [TylerBurnham42](https://github.com/tylerburnham42)

See also the list of [contributors](https://github.com/tylerburnham42/MercerSubProject/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Thanks to Dr. Anthony Choi for funding and support
* MIRL for the supplies and equipment 