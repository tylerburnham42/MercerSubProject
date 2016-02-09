#!/bin/bash
rosrun sub_message talker.py movt .05 0 0 2
rosrun sub_message talker.py movt -.05 0 0 2
rosrun sub_message talker.py movt 0.2 0 0 2
rosrun sub_message talker.py movt -.2 0 0 2
rosrun sub_message talker.py next
