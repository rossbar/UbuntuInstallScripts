# Order of Installation

Start from the top and work down

## Setup
1. Make sure you are up-to-date: `sudo update-manager`
2. Basic tools for git (so you can get this repo):
   `sudo apt-get install vim git xclip`
3. Install the rest of the basics: `sudo initial\_apt\_get.sh`
4. Install graphics drivers here as necessary (see `install_bumblebee.sh` for 
   laptops with nvidia optimus (i.e. discrete graphics cards))

## Configure Environment
5. Configure git. NOTE: make sure to change the user.name and user.email before
   running the script! Adjust other params according to preference.
   `configure\_git.sh`
6. Add color and git\_ps1 to bash prompt. Add any aliases as well.
   `configure\_bash.sh`
7. Personalize vim: vim\_upgrade.sh
8. [Setup fstab](https://gist.github.com/rossbar/c7bb5c6e0f18631b30fe) to
    auto-mount additional disks

## More system packages
<!-- Requires some user input - required for LBL network -->
9. Requires user I/O (have to agree to licenses etc.) This script is required 
   for operating on the LBL network (security will lock you out if you java 
   isn't up-to-date):
   `sudo install\_sun\_java.sh`
10. Dependencies for ROOT (not necessary if you're not going to install the
   ROOT analysis package):
   `sudo root\_dependencies.sh`
11. Install Qt4. This has to be complete before running the python installation
   scripts. Pulls >400 Mb from network:
   `sudo apt-get install qt-sdk`

## Python installation
12. Uses `apt-get` to install python packages for system python.
   >350 Mb from the network: `sudo python\_install.sh`
13. Use `pip` to upgrade the packages that were installed with `apt-get` in
    the previous script. This ensures that you have the most up-to-date version
    of python packages. **NOTE** some packages, particularly scipy and the
    PySide bindings, take a very long time to build (O(30min)).
    `sudo python\_upgrade.sh`
14. Mayavi installation is a bear, requires special attention to keep from
    borking everything:
    `sudo python_mayavi.sh`
15. Set up `virtualenv` and associated tools to combat python compatibility 
    issues when installing new packages:
    `sudo python\_virtualenv\_setup.sh`

# Robot Operating System and Apps
16. Install ros: `sudo install\_ros.sh`
17. Install rgbdslam: `install\_rgbdslamv2.sh`

# Install additional software
12. `sudo install\_latex.sh` - Pulls > 1Gb from internet
13. `install\_root.sh` - no sudo
13. `sudo install\_sis.sh` - Linux drivers for SIS cards + python wrappers
