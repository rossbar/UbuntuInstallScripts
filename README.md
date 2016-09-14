**Install Order**

# Setup
1. Make sure you are up-to-date: `sudo update-manager`
1. Basic tools for git (so you can get this repo):
   `sudo apt-get install vim git xclip`
1. Install the rest of the basics: `sudo initial\_apt\_get.sh`
1. Install graphics drivers here as necessary (see `install_bumblebee.sh` for 
   laptops with nvidia optimus (i.e. discrete graphics cards))
# Configure Environment
2. configure\_git.sh
3. configure\_bash.sh - Set up bash prompt and universal aliases
<!-- Requires some user input - required for LBL network -->
4. sudo install\_sun\_java.sh - Requires user interaction
6. sudo root\_dependencies.sh - Pulls >100 Mb from internet
7. sudo sis\_dependencies.sh <!-- ONLY FOR 12.04 -->
8. sudo apt-get install qt-sdk - Pulls > 250 Mb from internet
9. sudo python\_install.sh - Pulls > 350 Mb from internet
10. sudo python\_upgrade.sh - Scipy takes a real long time to compile
10. sudo python\_mayavi.sh - Mayavi installation is a bear, requires special 
                             attention to keep from borking everything
10. sudo python\_virtualenv\_setup.sh
11. sudo install\_ros.sh
11. install\_rgbdslamv2.sh
12. sudo install\_latex.sh - Pulls > 1Gb from internet
13. install\_root.sh - no sudo
13. sudo install\_sis.sh - Only works in 12.04
14. vim\_upgrade.sh
15. [Setup fstab](https://gist.github.com/rossbar/c7bb5c6e0f18631b30fe) to
    auto-mount additional disks
