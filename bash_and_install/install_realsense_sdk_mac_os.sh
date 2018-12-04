#Instructions for installing the Realsense SDK on Mac OS

#the following lines are entered directly into a terminal unless proceeded by a hashtag (#) in which case it is just a comment. 

#This code does not work out of the box! You will need to manually replace my path names with your own path names
#This is relevant to lines 40, possibly 44, and 52.

#assuming you have homebrew installed via

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#and you’ve checked that it works via

brew doctor

#you can proceed as follows:

brew install libusb pkg-config
brew install homebrew/core/glfw3
brew install cmake
brew install librealsense

#all of these things should now be visible in /usr/local/lib 
#after brew installing librealsense you should be able to immediately type realsense-viewer into the terminal and see the viewer

#next clone librealsense library

git clone https://github.com/IntelRealSense/librealsense.git

#cd into the folder you just cloned

cd librealsense

mkdir build && cd build

#when you run cmake, it’s useful to specify the -DPYTHON_EXECUTABLE=[whatever your executable path is]
#in order to find your executable path you can go into python, import sys, and run print(sys.executable)
#replace my executable path with whatever YOUR executable path is below 

cmake .. -DBUILD_EXAMPLES=false -DBUILD_GRAPHICAL_EXAMPLES=false -DBUILD_WITH_OPENMP=false -DHWM_OVER_XU=false -DBUILD_PYTHON_BINDINGS=true -G Unix\ Makefiles -DPYTHON_EXECUTABLE=/Users/ranyoha/anaconda3/bin/python 

#when you run make you need to specify the library path (as shown below) or else you may get an error saying lusb-1.0 is not found. brew install puts libraries into /usr/local/lib (for me)

make LIBRARY_PATH=/usr/local/lib

make install

#now open python and check that import pyrealsense2 works. the import will not work if you do not append the path as shown below

#python

#>>>sys.path.append('/usr/local/lib')

#>>>import pyrealsense2 as rs

#you may get the error below but you can ignore it as the functions should still work
# /Users/ranyoha/anaconda3/lib/python3.6/importlib/_bootstrap.py:219: FutureWarning: pybind11-bound class 'pyrealsense2.processing_block' is using an old-style placement-new '__init__' which has been deprecated. See the upgrade guide in pybind11's docs. This message is only visible when compiled in debug mode. return f(*args, **kwds) /Users/ranyoha/anaconda3/lib/python3.6/importlib/_bootstrap.py:219: FutureWarning: pybind11-bound class 'pyrealsense2.filter' is using an old-style placement-new '__init__' which has been deprecated. See the upgrade guide in pybind11's docs. This message is only visible when compiled in debug mode. return f(*args, **kwds)