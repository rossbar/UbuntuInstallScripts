#! /bin/bash

# Specify directory structure for src/build
PARENT_DIR=$HOME/geant4
SRC_DIRNAME=source
REPO_LINK=https://github.com/Geant4/geant4.git

# CMake options
CONFIG_OPTS="-DCMAKE_INSTALL_PREFIX=$PARENT_DIR/install \
             -DGEANT4_BUILD_MULTITHREADED=ON \
             -DGEANT4_INSTALL_DATA=ON \
             -DGEANT4_INSTALL_DATADIR=$PARENT_DIR/data \
             -DGEANT4_USE_QT=ON \
             -DGEANT4_USE_SYSTEM_ZLIB=ON \
            "

# Number of CPUs to use for build
NUM_CPUS=$(cat /proc/cpuinfo | grep processor | wc -l)

# Download src code from github mirror
mkdir -p $PARENT_DIR && cd $_
git clone $REPO_LINK $SRC_DIRNAME

# Make data directory for CLHEP data (can ignore if -DGEANT_INSTALL_DATA flag
# is turned off)
mkdir -p $PARENT_DIR/data $PARENT_DIR/install

# Make build directory (NOTE: when using source code from git repo, build dir
# must be outside of repo).
mkdir -p build && cd $_
cmake $CONFIG_OPTS ../$SRC_DIRNAME

## Build
make -j $NUM_CPUS

## Install
make install

## Post-install: set up environment
echo "# Setup environment for Geant4" >> $HOME/.bashrc
echo "source $PARENT_DIR/install/bin/geant4.sh" >> $HOME/.bashrc
