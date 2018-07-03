# Real_Sensible_Moseq
Integrating Intel's Realsense cameras to the Moseq pipeline

Moseq is a method developed by the Datta lab to track and analyze the behavior of freely behaving mice. Originally, mice were visualized using an Xbox Kinect depth sensing camera. Xbox discontinued the production and support of these cameras which has forced us to switch to new hardware (adapt or die!). 

Intel's Realsense cameras (which are obviously also depth sensing) look like a promising substitute. They are different in a few ways: rather than using time of flight (the way the Kinect calculates depth), depth is calcualted with stereovision (two images triangulated to one depth map). The camera is much smaller and is also capable of infrared and rgb streams. The camera can also stream much faster (90Hz vs 30Hz) with higher resolution. 

Unfortunatley, there are a ton of undescribed acquisition parameters than can affect the quality of the images. This means there is a lot of optimization that has to be done before the camera can be used. The camera is also quite new which means there are many bugs (constant firmware updates) and unreleased features (such as syncing multiple cameras). 

It's NO MATTER because that's what this project is all about!

Rockwell