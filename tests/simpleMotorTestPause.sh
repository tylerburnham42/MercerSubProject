#!/bin/bash
rosrun sub_message talker.py movt .2 .2 .2 3
rosrun sub_message talker.py pause 3
rosrun sub_message talker.py movt -.2 -.2 -.2 3
rosrun sub_message talker.py pause 3
rosrun sub_message talker.py rott .2 .2 .2 3
rosrun sub_message talker.py next
