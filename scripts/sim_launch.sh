SCRIPT_DIR=$(cd $(dirname $0); pwd)
HOME_DIR=$(pwd)

cd $SCRIPT_DIR
cd ../
WORK_SCAPE=$(pwd)
source ./install/setup.bash
# MAP_DIR=$(pwd)/assets
# MAP_DIR=$(pwd)/assets2
# MAP_DIR=$(pwd)/assets3
# MAP_DIR=$(pwd)/assets4
MAP_DIR=$(pwd)/assets5

if [ $# -gt 0 ]; then
    MAP_DIR=$(pwd)/assets$1
fi
echo "Using map directory is '$MAP_DIR'"

ros2 launch autoware_launch planning_simulator.launch.xml \
 vehicle_model:=logiee-s-tc \
 sensor_model:=logiee-s-tc_sensor_kit \
 pointcloud_container:=/sensing/lidar/front/outlier_filtered/pointcloud \
 map_path:=${MAP_DIR} 

cd $HOME_DIR
