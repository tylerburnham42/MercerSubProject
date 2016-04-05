#!/bin/bash 
cd ~/MercerSubProject
rm -r ~/MercerSubProject/devel
source /opt/ros/jade/setup.bash
catkin_make
source ~/MercerSubProject/devel/setup.bash
