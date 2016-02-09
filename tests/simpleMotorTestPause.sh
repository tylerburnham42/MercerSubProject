#!/bin/bash
rosrun sub_message talker.py movt .02 0 0 3
rosrun sub_message talker.py pause 3.5
rosrun sub_message talker.py movt -.02 0 0 3
rosrun sub_message talker.py next
