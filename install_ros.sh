#! /bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

# Get ubuntu version                                                            
VERSION_STRING=`lsb_release -r`                                                 
VERSION=${VERSION_STRING//[A-Z:a]/}
echo "Detected Ubuntu Version: $VERSION"

# Choose correct apt repository for different ubuntu versions
if [ $VERSION == "12.04" ]; then
  echo "deb http://packages.ros.org/ros/ubuntu precise main" > /etc/apt/sources.list.d/ros-latest.list
  ROSTYPE=hydro
elif [ $VERSION == "14.04" ]; then
  echo "deb http://packages.ros.org/ros/ubuntu trusty main" > /etc/apt/sources.list.d/ros-latest.list
  ROSTYPE=indigo
elif [ $VERSION == "16.04" ]; then
  echo "deb http://packages.ros.org/ros/ubuntu xenial main" > /etc/apt/sources.list.d/ros-latest.list
  ROSTYPE=kinetic
else
  echo "Automated install only configured for 12.04, 14.04, 16.04"
  echo "Exiting..."
  exit 1
fi

# Setup keys
wget https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -O - | apt-key add -

# Update repos
apt-get update

# Install different ros version, depending on the ubuntu version
apt-get install -y ros-$ROSTYPE-desktop-full
apt-get install -y ros-$ROSTYPE-openni-launch

# Set up ROS environment for this session
sudo -u $SUDO_USER bash<<___
  source /opt/ros/$ROSTYPE/setup.bash
___

# Initialize rosdep
rosdep init

# Use rosdep to update - Don't run as root or permissions get screwed up
sudo -u $SUDO_USER bash<<___
  echo "# Setup ros environment" >> ~/.bashrc
  echo "source /opt/ros/$ROSTYPE/setup.bash" >> ~/.bashrc
  rosdep update
___

# Get addtional ros tools
apt-get install -y python-rosinstall python-wstool

# For lsd slam in ros indigo
if [ $VERSION == "14.04" ]; then
  apt-get install -y ros-indigo-libg2o ros-indigo-cv-bridge liblapack-dev libblas-dev freeglut3-dev libqglviewer-dev libsuitesparse-dev libx11-dev
fi
