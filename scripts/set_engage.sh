SCRIPT_DIR=$(cd $(dirname $0); pwd)
HOME_DIR=$(pwd)

cd $SCRIPT_DIR
cd ../
WORK_SCAPE=$(pwd)
source ./install/setup.bash

ros2 topic pub /autoware/engage autoware_auto_vehicle_msgs/msg/Engage "engage: true" -1
cd $HOME_DIR
