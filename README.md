# Order of Installation

Start from the top and work down

**WARNING** - These scripts are intended for use on a brand new install - there
is currently no checking to see if software has been previously installed. This
doesn't matter for many of the scripts that use package managers (apt-get, pip,
etc.) but may cause problems for standalone installations.

  **Setup**

1. `sudo update-manager`: Make sure you are up-to-date.
2. `sudo apt-get install vim git xclip`: Basic tools for git
   (so you can get this repo).
3. `sudo initial\_apt\_get.sh` Install the rest of the basics.
4. Install graphics drivers here as necessary (see `install_bumblebee.sh` for 
   laptops with nvidia optimus (i.e. discrete graphics cards))

  **Configure Environment**

5. `configure\_git.sh`: Configure git. **NOTE**: make sure to change the
   user.name and user.email before running the script! Adjust other params
   according to preference.
   
6. `configure\_bash.sh`: Add color and git\_ps1 to bash prompt. Add any aliases
   as well.
7. vim\_upgrade.sh: Personalize vim.
8. [Setup fstab](https://gist.github.com/rossbar/c7bb5c6e0f18631b30fe) to
   auto-mount additional disks

  **More system packages**

9. `sudo install\_sun\_java.sh`: Install sun version of java. **NOTE**: 
   Requires user I/O (have to agree to licenses etc.) **WARNING**: sun java
   implementation is NOT open-source.
   
10. `sudo root\_dependencies.sh`: Dependencies for ROOT (not necessary if
   you're not going to install the 
   [ROOT analysis package](https://root.cern.ch/) package).
   
11. `sudo apt-get install qt-sdk`: Install Qt4. This has to be complete before
   running the python installation scripts. **NOTE**: Downloads >400 Mb from
   network.
   

  **Python installation**

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

  **Robot Operating System and Apps**

16. Install ros: `sudo install\_ros.sh`
17. Install rgbdslam: `install\_rgbdslamv2.sh`

  **Install additional software**

18. `sudo install\_latex.sh` - Pulls > 1Gb from internet
19. `install\_root.sh` - no sudo
20. `sudo install\_sis.sh` - Linux drivers for SIS cards + python wrappers
