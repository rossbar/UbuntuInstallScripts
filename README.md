# Order of Installation

Start from the top and work down

**WARNING** - These scripts are intended for use on a brand new install - there
is currently no checking to see if software has been previously installed. This
doesn't matter for many of the scripts that use package managers (apt-get, pip,
etc.) but may cause problems for standalone installations.

  **Setup**

1. `sudo apt-get update && apt-get upgrade`: Make sure you are up-to-date.
2. `sudo apt-get install vim git xclip`: Basic tools for git
   (so you can get this repo).
3. `sudo initial_apt_get.sh` Install the rest of the basics.
4. Install graphics drivers here as necessary (see `install_bumblebee.sh` for 
   laptops with nvidia optimus (i.e. discrete graphics cards)).
   For CUDA installation, see next step.

  **Cuda Install**

There are many ways to do this.
The simplest that I've found is as follows:
 - Use the "Additional Drivers" mechanism to enable the proprietary nvidia
   drivers. Reboot.
 - Download the appropriate CUDA toolkit from 
   [here](https://developer.nvidia.com/cuda-downloads?target_os=Linux). 
   You want the network .deb
 - Ensure that 1) there is one and *only* one cuda-repo-\*.deb file in 
   `~/Downloads` and 2) the nvidia driver from the previous steps is installed
   correctly (check this with `nvidia-smi`).
 - Run `install_cuda.sh`. Reboot again.
 - Add the CUDA bin/runtimes to your environment:
```bash
echo "export PATH=/usr/local/cuda-TOOLKITVER/bin:$PATH" >> $HOME/.bashrc
echo "export LD_LIBRARY_PATH=/usr/local/cuda-TOOLKITVER/lib64:$LD_LIBRARY_PATH" >> $HOME/.bashrc
```
   Where TOOLKITVER = the version of the cuda toolkit that was installed.
 - As a simple check to make sure everything is set up properly: `nvcc --version`.
   If you get `command not found`, something is wrong with the PATH
 - As a more thorough check to make sure everything is set up properly, use
   `cuda-install-samples-9.1.sh` to install the toolkit samples, then pick one
   to try to compile and run.

  **Configure Environment**

5. `configure_git.sh`: Configure git. **NOTE**: make sure to change the
   user.name and user.email before running the script! Adjust other params
   according to preference.
   
6. `configure_bash.sh`: Add color and git\_ps1 to bash prompt. Add any aliases
   as well.
7. `vim_upgrade.sh`: Personalize vim.
8. [Setup fstab](https://gist.github.com/rossbar/c7bb5c6e0f18631b30fe) to
   auto-mount additional disks

  **More system packages**

9. `sudo install_sun_java.sh`: Install sun version of java. **NOTE**: 
   Requires user I/O (have to agree to licenses etc.) **WARNING**: sun java
   implementation is NOT open-source.
   
10. `sudo root_dependencies.sh`: Dependencies for ROOT (not necessary if
   you're not going to install the 
   [ROOT analysis package](https://root.cern.ch/)).
   
11. `sudo apt-get install qt-sdk`: Install Qt4. This has to be complete before
   running the python installation scripts. **NOTE**: Downloads >400 Mb from
   network.
   

  **Python installation**

12. `sudo python_install.sh`: Use `apt-get` to install python packages for
   system python. **NOTE**: Downloads >350 Mb from the network.

13. `sudo -H python_upgrade.sh`. Use `pip` to upgrade the packages that were
   installed with `apt-get`, as well as install new python packages to the
   system python. **NOTE**: some packages, particularly scipy and the PySide
   bindings, take a very long time to build (O(30min)).
   
14. `sudo python_mayavi.sh`: Mayavi installation is annoying, requires special
   attention to keep from borking python environment.
   
15. `sudo python_virtualenv_setup.sh`: Set up `virtualenv` and associated
   tools to combat python compatibility issues when installing new packages.
   

  **Robot Operating System and Apps**

16. `sudo install_ros.sh`: Install the 
   [Robot Operating System](http://www.ros.org/).
17. `install_rgbdslamv2.sh`: Install 
   [RGBDSLAM](http://felixendres.github.io/rgbdslam_v2/) for SLAM with Kinect.

  **Install additional software**

18. `sudo install_latex.sh`: Install latex and commonly-used packages for
   writing scientific papers. **NOTE**: Pulls > 1Gb from internet.
19. `install_root.sh`: Install the [ROOT](https://root.cern.ch/) analysis
   framework for physics data. **NOTE**: No `sudo` for this script.
20. Install SIS: See [this repo](https://github.com/bearing/SIS/)
