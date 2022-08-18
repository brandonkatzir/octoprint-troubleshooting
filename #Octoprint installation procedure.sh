#Octoprint installation procedure
# https://community.octoprint.org/t/setting-up-octoprint-on-a-raspberry-pi-running-raspberry-pi-os-debian/2337

# Dependency no. 1
# On my clean installation of Ubuntu, python 3.10.4 is already installed

# Python's package manager, pip, is NOT installed
# I installed with the following code

sudo apt install python3-pip

# Afterwards type the following code

pip3 --version

# You should get a version number-- mine is pip 22.0.2 followed by the path wherein pip is located

# The code under "Basic Installation" is creating python dependencies in a directory called Octoprint and then moving
# you into Octoprint so that the installation is not system-wide. So it's important to remember everything installed will
# follow this particular path 

cd ~
sudo apt update
sudo apt install python3-pip python3-dev python3-setuptools python3-venv git libyaml-dev build-essential
mkdir OctoPrint && cd OctoPrint
python3 -m venv venv
source venv/bin/activate

# After the command is complete, run the following code

ls -la 

# You should see the usual . and .. followed by venv

# Then you'll upgrade pip and install octoprint with pip using the following code

pip install pip --upgrade
pip install octoprint

# I skipped the dialout group instructions since I don't have any ports to modify, but it might be 
# necessary to run these commands 

sudo usermod -a -G tty pi
sudo usermod -a -G dialout pi

# This is an access issue and should run without issue

# I then ran the following command

octoprint serve

# And the server was created successfully

# This downloads the script files from the OctoPrint github
wget https://github.com/OctoPrint/OctoPrint/raw/master/scripts/octoprint.service && sudo mv octoprint.service /etc/systemd/system/octoprint.service

# I double checked the automatic startup config by entering the following command

cd /etc/systemd/system
ls -la

# You should see octoprint.service in this list. Take a look at the file by running the following command

nano octoprint.service

# You should see the script about halfway down the page that says
# ExecStart=/home/pi/OctoPrint/venv/bin/octoprint
# Press ctrl X to leave the editor

