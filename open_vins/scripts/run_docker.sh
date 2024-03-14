xhost +
export DOCKER_CATKINWS=/home/robotlab/scratch/odometry/open_vins
export DOCKER_CATKINWS_ORBSLAM3=/home/robotlab/scratch/odometry/ORB_SLAM3
export DOCKER_DATASETS=/home/robotlab/scratch/datasets/ov_dataset
docker run  -it --runtime=nvidia  --net=host --gpus all \
    --env NVIDIA_DRIVER_CAPABILITIES=all --env DISPLAY=$DISPLAY \
    --env QT_X11_NO_MITSHM=1  --volume /tmp/.X11-unix:/tmp/.X11-unix --privileged  \
    --volume /dev:/dev \
    --mount type=bind,source=$DOCKER_CATKINWS,target=/catkin_ws/src/open_vins \
    --mount type=bind,source=$DOCKER_CATKINWS_ORBSLAM3,target=/catkin_ws/src/ORB_SLAM3 \
    --mount type=bind,source=$DOCKER_DATASETS,target=/datasets $1 open_vins bash
   
