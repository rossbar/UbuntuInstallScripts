INSTALL_DIR=$HOME/velodyne_catkin_ws

# Get source
mkdir -p $INSTALL_DIR/src && cd $_
git clone git@github.com:rossbar/velodyne.git

# Dependencies
cd $INSTALL_DIR
rosdep install --from-paths src --ignore-src --rosdistro $ROS_DISTRO -y

# Build
catkin_make
