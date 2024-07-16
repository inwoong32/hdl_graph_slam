#!/bin/bash
xhost +local:docker

IMAGE=hdl_graph_slam:v0
XSOCK=/tmp/.X11-unix
XAUTH=$HOME/.Xauthority
SHARED_DOCK_DIR=/root/catkin_ws
SHARED_HOST_DIR=$(dirname $0)/hdl_graph_slam

clear
echo "=============================="
echo "==========Run $IMAGE"
echo "=============================="

VOLUMES="--volume=$XSOCK:$XSOCK:rw	
	--volume=$XAUTH:$XAUTH:rw
	--volume=$SHARED_HOST_DIR:$SHARED_DOCK_DIR:rw
	--volume=/etc/localtime:/etc/localtime:ro
	--volume=/etc/timezone:/etc/timezone:ro"

ENVIRONS="--env DISPLAY=${DISPLAY}
	--env XAUTHORITY=${XAUTU}"

docker run \
	-it\
	--runtime=nvidia \
	--gpus all \
	$ENVIRONS \
	$VOLUMES \
	-w $SHARED_DOCK_DIR \
	--privileged \
	--net=host \
	$IMAGE
