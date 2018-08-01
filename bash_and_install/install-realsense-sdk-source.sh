#!/bin/bash

#The point of this script is to download the librealsense SDK so you may import it into your python scripts (>>import pyrealsense2)

#First make sure you have git and cmake installed!
#You should be able to type the following into a terminal (don't include $):
# $ git --version
# $ cmake --version

#Librealsense SDK also requires you to install libusb-1.0
# $ sudo apt-get install libusb-1.0-0-dev

#INSTALLING LIBREALSENSE SDK FROM SOURCE

#Open a terminal and type the following (don't type the $ or >> or anything after %):
# $ python                %hopefully you see the latest version (in my case python 3.6.4)
# >>import sys
# >>print(sys.executable) %hopefully you see something like /home/yourname/miniconda3/bin/python
# >>quit()

#Copy and paste the output of >>print(sys.executable) you will need it for line 

cd

#Line 1
git clone https://github.com/IntelRealSense/librealsense

#Line 2
cd librealsense

#Line 3
mkdir build

#Line 4
cd build 

#Line 5 %COPY AND PASTE THE OUTPUT OF >>print(sys.executable) AFTER -DBUILD_PYTHON_EXECUTABLE=
cmake ../ -DBUILD_PYTHON_BINDINGS=TRUE -DBUILD_EXAMPLES=false -DBUILD_GRAPHICAL_EXAMPLES=false -DBUILD_PYTHON_EXECUTABLE=/home/rockwell/miniconda3/bin/python

#Line 6
make -j4

echo -e "\n\n\n"

echo "Installation Complete! Now you can import pyrealsense ONLY IF YOU ARE IN THE librealsense/build/wrappers/python folder:"

echo -e "\n\n\n"

echo "If you have sudo access and want the SDK library anywhere on your system, then you can execute the command sudo make install in the terminal while in the /librealsense/build/ folder:"

echo -e "\n\n\n"

echo "...Let's go ahead and try that"

cd
cd librealsense/build/
sudo make install

echo -e "\n\n\n"

echo "If that worked then you should be able to import pyrealsense2 like so:"

echo -e "\n\n\n"

echo ">>import sys"
echo ">>sys.path.append('usr/local/lib')"
echo ">>import pyrealsense2 as rs"

echo -e "\n\n\n"

echo "You may need to close and reopen terminal for this to work"
echo "The import may fail if CMAKE did not target your installation to usr/local/lib"


