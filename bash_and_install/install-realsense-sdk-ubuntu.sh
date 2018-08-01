#!/bin/bash

echo 'deb http://realsense-hw-public.s3.amazonaws.com/Debian/apt-repo xenial main' | sudo tee /etc/apt/sources.list.d/realsense-public.list

sudo apt-key adv --keyserver keys.gnupg.net --recv-key 6F3EFCDE

sudo apt-get update

sudo apt-get install librealsense2-dkms

sudo apt-get install librealsense2-utils

sudo apt-get install librealsense2-dev

sudo apt-get install librealsense2-dbg

echo -e "\n\n\n\n\n"

echo "Installation Complete!"

echo -e "\n\n\n"

echo "You can compile a new C++ script called filename.cpp using the librealsense SDK by typing:"
echo "g++ -std=c++11 filename.cpp -lrealsense2"

echo -e "\n\n\n"

echo "Type realsense-viewer in the command line, plug in a realsense camera, and get going!"

echo -e "\n\n\n"

echo "To uninstall, copy, paste, and execute the line below:"

echo "dpkg -l | grep "realsense" | cut -d " " -f 3 | xargs sudo dpkg --purge"
