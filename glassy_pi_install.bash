# João Lehodey - June 7th, 2024
# ROS installation:

sudo apt update && sudo apt install locales -y
sudo locale-gen en_US en_US.UTF-8 
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 
export LANG=en_US.UTF-8

sudo apt install software-properties-common -y
sudo add-apt-repository universe

sudo apt update && sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

sudo apt update
sudo apt upgrade -y

sudo apt install ros-humble-ros-base -y
sudo apt install python3-colcon-common-extensions -y
sudo apt install ros-dev-tools -y





# Install uXRCE_DDS agent
cd ~
sudo apt install git -y
git clone https://github.com/eProsima/Micro-XRCE-DDS-Agent.git
cd Micro-XRCE-DDS-Agent
mkdir build
cd build
cmake ..
make
sudo make install
sudo ldconfig /usr/local/lib/

# activate tx rx /gpio
sudo apt update -y
sudo apt upgrade -y
sudo apt-get install raspi-config -y


#####------------------------
#
# Now follow step 3 onwards in https://docs.px4.io/main/en/companion_computer/pixhawk_rpi.html
#
#
#####------------------------

#download px4 messages 
cd ~
mkdir -p ~/px4_ros2_ws/src
cd ~/px4_ros2_ws/src
git clone https://github.com/PX4/px4_msgs.git 
cd ~/px4_ros2_ws
colcon build

