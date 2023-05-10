SCRIPT_DIR=$(cd $(dirname $0); pwd)
HOME_DIR=$(pwd)

cd $SCRIPT_DIR
cd ../
WORK_SCAPE=$(pwd)
source ./install/setup.bash
MAP_DIR=$(pwd)/assets
# GOAL_LIST_FILE_PATH=$(pwd)/scripts/goal

if [ $# -gt 0 ]; then
    MAP_DIR=$(pwd)/assets$1
fi
echo "Using map directory is '$MAP_DIR'"

ros2 launch autoware_launch autoware.launch.xml \
 vehicle_model:=logiee-s-tc \
 sensor_model:=logiee-s-tc_sensor_kit \
 pointcloud_container:=/sensing/lidar/front/outlier_filtered/pointcloud \
 use_traffic_light_recognition:=false \
 traffic_light_recognition/enable_fine_detection:=false \
 use_crosswalk_traffic_light_estimator:=false \
 use_dynamic_map_loading:=false \
 use_object_filter:=true \
 use_surround_obstacle_check:=false \
 map_path:=${MAP_DIR} 

cd $HOME_DIR
