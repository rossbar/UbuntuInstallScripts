INSTALL_DIR=$HOME/vectornav_catkin_ws

# Get source
mkdir -p $INSTALL_DIR/src && cd $_
git clone git@gitlab.com:rossbar/vectornav300.git

# Dependencies
cd $INSTALL_DIR
rosdep install --from-paths src --ignore-src --rosdistro $ROS_DISTRO -y

# Build
catkin_make

# NOTE required to make work on 14.04 - figure out what's wrong with CMakeLists
# to fix
catkin_make install
