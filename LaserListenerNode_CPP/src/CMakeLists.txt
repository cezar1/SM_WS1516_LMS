cmake_minimum_required(VERSION 2.8.3)
project(laser_proc)
 
## Find catkin and any catkin packages
find_package(catkin REQUIRED COMPONENTS roscpp rospy std_msgs genmsg)
 
## Declare ROS messages and services
 
## Generate added messages and services
generate_messages(DEPENDENCIES std_msgs)
 
## Declare a catkin package
catkin_package()

set(laser_proc_SRCS
  laser_proc/laserScanAdd.cpp
)

set(laser_proc2_SRCS
  laser_proc2/laserScanAdd.cpp
)

add_executable(laser_proc ${laser_proc_SRCS})
add_executable(laser_proc2 ${laser_proc2_SRCS})

target_link_libraries(laser_proc ${catkin_LIBRARIES})
target_link_libraries(laser_proc2 ${catkin_LIBRARIES})

