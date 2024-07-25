FROM ros:noetic

RUN apt-get update && apt-get install -y --no-install-recommends \
  && apt-get install -y --no-install-recommends \
  wget nano build-essential libomp-dev clang lld git\
  ros-noetic-geodesy ros-noetic-pcl-ros ros-noetic-nmea-msgs \
  ros-noetic-rviz ros-noetic-tf-conversions ros-noetic-libg2o \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /root/catkin_ws/src

RUN /bin/bash -c '. /opt/ros/noetic/setup.bash; catkin_init_workspace'
RUN echo 'alias cm='catkin_make --cmake-args -DCMAKE_BUILD_TYPE=Release' >> ~/.bashrc
RUN echo 'source /root/catkin_ws/devel/setup.bash' >> ~/.bashrc

WORKDIR /root/catkin_ws

ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]
