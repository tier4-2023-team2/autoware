SCRIPT_DIR=$(cd $(dirname $0); pwd)
HOME_DIR=$(pwd)

cd $SCRIPT_DIR
cd ../
WORK_SCAPE=$(pwd)
source ./install/setup.bash
MAP_DIR=$(pwd)/assets6
# GOAL_LIST_FILE_PATH=$(pwd)/scripts/goal
echo "Using map directory is '$MAP_DIR'"

USE_DEFAULT_POSE_ESTIMATOR=true
RVIZ=true
while getopts 'd:nr' opt; do
    case "${opt}" in
        d) MAP_DIR=$(pwd)/assets$OPTARG;;
        n) USE_DEFAULT_POSE_ESTIMATOR=false;; #use nerf
        r) RVIZ=false;;
    esac
done

echo map_dir = $MAP_DIR
echo $USE_DEFAULT_POSE_ESTIMATOR
echo $RVIZ

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
 use_empty_dynamic_object_publisher:=false \
 use_gpu:=true \
 image_number:=0 \
 use_empty_dynamic_object_publisher:=true \
 rviz:=${RVIZ} \
 use_default_pose_estimator:=${USE_DEFAULT_POSE_ESTIMATOR} \
 map_path:=${MAP_DIR}

cd $HOME_DIR
