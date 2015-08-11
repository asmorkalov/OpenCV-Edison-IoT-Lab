#!/bin/sh

sudo apt-get install -y zlib1g-dev libjpeg-dev libpng12-dev libtiff5-dev libjasper-dev libgtk2.0-dev libavcodec-dev libavdevice-dev libavfilter-dev libavformat-dev libavutil-dev libpostproc-dev libswscale-dev libeigen3-dev libtbb-dev
wget http://downloads.sourceforge.net/project/opencvlibrary/opencv-unix/3.0.0/opencv-3.0.0.zip
unzip ./opencv-3.0.0.zip
mkdir opencv-build
cd opencv-build
cmake -DWITH_CUDA=OFF ../opencv-3.0.0
make -j6
cd -
mkdir opencv-build-board
cd opencv-build-board
cmake -DCMAKE_TOOLCHAIN_FILE=../edison.toolchain.cmake -DWITH_IPP=ON -DWITH_TBB=ON -DBUILD_TBB=ON -DBUILD_PNG=ON -DBUILD_JPEG=ON -DBUILD_JASPER=ON -DBUILD_TIFF=ON -DBUILD_OPENEXR=ON -DWITH_1394=OFF -DWITH_FFMPEG=OFF -DWITH_GTK=OFF -DWITH_CUDA=OFF -DWITH_OPENCL=OFF -DBUILD_SHARED_LIBS=OFF -D BUILD_PERF_TESTS=OFF -D BUILD_TESTS=ON ../opencv-3.0.0
make -j6