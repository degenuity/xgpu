#!/bin/bash

# Update package list and install necessary packages

sudo apt update
echo "---------------------------"

sudo apt -y install ocl-icd-opencl-dev
echo "---------------------------"

sudo apt -y install nano
echo "---------------------------"

sudo apt -y install htop
echo "---------------------------"

# sudo apt -y install nvtop
sudo apt -y install cmake
echo "---------------------------"

sudo apt -y install python3-pip
echo "---------------------------"

# Clone the repository and build the project
git clone https://github.com/shanhaicoder/XENGPUMiner.git
echo "---------------------------"

cd XENGPUMiner
echo "---------------------------"

chmod +x build.sh
echo "---------------------------"

./build.sh
echo "---------------------------"

# Update the configuration file
sed -i 's/account = 0x24691e54afafe2416a8252097c9ca67557271475/account = 0xca5F023af4F822353A563Ae6a3591bA2024495E8/g' config.conf
echo "---------------------------"

# Install Python requirements
sudo pip install -U -r requirements.txt
echo "---------------------------"

sudo nohup python3 miner.py --gpu=true > miner.log 2>&1 &
echo "---------------------------"

sudo nohup ./xengpuminer > xengpuminer.log 2>&1 &
echo "---------------------------"
