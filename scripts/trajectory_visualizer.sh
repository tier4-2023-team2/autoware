SCRIPT_DIR=$(cd $(dirname $0); pwd)
HOME_DIR=$(pwd)
cd $SCRIPT_DIR
cd ../
WORK_SCAPE=$(pwd)
source ./install/setup.bash

ros2 run planning_debug_tools trajectory_visualizer.py

cd $HOME_DIR