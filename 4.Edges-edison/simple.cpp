#include "opencv2/opencv.hpp"

using namespace cv;

int main(int argc, char** argv)
{
    Mat img, gray, edges;
    img = imread(argv[1], 1);
    cvtColor(img, gray, COLOR_BGR2GRAY);
    GaussianBlur(gray, gray, Size(7, 7), 1.5);
    Canny(gray, edges, 0, 50);
    imwrite("result.png", edges);
    return 0;
}