0. Setup
--------

Presentation: https://docs.google.com/presentation/d/1QTjIc7SYYPDvMjUz48SvLBXkPsa0FZaft1zA4e31U6g/edit?usp=sharing

    $ sudo apt-get install -y wget git cmake build-essential
    $ git clone <repo_path>
    $ ./setup.sh # installs all required deps

1. Simple processing
--------------------

    $ cd 1.Simple
    $ cmake -DOpenCV_DIR=../opencv-build/
    $ make
    $ ./simple ../lena.png

2. Live video
-------------

    $ cd 2.Live
    $ cmake -DOpenCV_DIR=../opencv-build/
    $ make
    $ ./live

3. Face detection
-----------------

    $ cd 3.FaceDetect
    $ cmake -DOpenCV_DIR=../opencv-build/
    $ make
    $ ./facedetect ../lena.png

4. Face detection - device
--------------------------

    $ cd 3.FaceDetect
    $ cmake -DCMAKE_TOOLCHAIN_FILE=../edison.toolchain.cmake -DOpenCV_DIR=../opencv-build/
    $ make
    scp ./facedetect root@192.168.2.15:/home/root/
    scp ../lena.png root@192.168.2.15:/home/root/
    $ ssh root@192.168.2.15 "/home/root/facedetect /home/root/lena.png"
