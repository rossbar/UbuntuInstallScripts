#! /bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

# Get ubuntu version                                                            
VERSION_STRING=`lsb_release -r`                                                 
VERSION=${VERSION_STRING//[A-Z:a]/}

# Choose correct apt repository for different ubuntu versions
if [ $VERSION == "12.04" ]; then
  echo "deb http://packages.ros.org/ros/ubuntu precise main" > /etc/apt/sources.list.d/ros-latest.list
elif [ $VERSION == "14.04" ]; then
  echo "deb http://packages.ros.org/ros/ubuntu trusty main" > /etc/apt/sources.list.d/ros-latest.list
else
  echo "Detected Ubuntu Version: $VERSION"
  echo "Automated install only configured for 12.04, 14.04"
  echo "Exiting..."
fi

# Setup keys
wget https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -O - | apt-key add -

# Update repos
apt-get update

# Install different ros version, depending on the ubuntu version
echo "# Setup ros environment" >> ~/.bashrc
if [ $VERSION == "12.04" ]; then
  apt-get install ros-hydro-desktop-full
  echo "source /opt/ros/hydro/setup.bash" >> ~/.bashrc
elif [ $VERSION == "14.04" ]; then
  apt-get install ros-indigo-desktop-full
  echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
fi

# Initialize rosdep
rosdep init
rosdep update

# Get rosinstall
apt-get install python-rosinstall


