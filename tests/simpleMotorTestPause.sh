#!/bin/bash
rosrun sub_message talker.py movt .02 .02 .02 3
rosrun sub_message talker.py pause 3
rosrun sub_message talker.py movt -.02 -.02 -.02 3
rosrun sub_message talker.py next
