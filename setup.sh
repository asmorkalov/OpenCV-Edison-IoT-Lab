#!/bin/sh

sudo apt-get install -y zlib1g-dev libjpeg-dev libpng12-dev libtiff5-dev libjasper-dev libgtk2.0-dev libavcodec-dev libavdevice-dev libavfilter-dev libavformat-dev libavutil-dev libpostproc-dev libswscale-dev libeigen3-dev libtbb-dev
wget http://downloads.sourceforge.net/project/opencvlibrary/opencv-unix/3.0.0/opencv-3.0.0.zip
unzip ./opencv-3.0.0.zip
mkdir opencv-build
cd opencv-build
cmake -DWITH_CUDA=OFF ../opencv-3.0.0
make -j6
cd -