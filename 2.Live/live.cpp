#include "opencv2/opencv.hpp"

using namespace cv;

int main(int argc, char** argv)
{
    Mat img;
    VideoCapture cap(0);
    for(;;)
    {
        cap >> img;
        imshow("Live", img);
        if(waitKey(30) >= 0) break;
    }
    return 0;
}
