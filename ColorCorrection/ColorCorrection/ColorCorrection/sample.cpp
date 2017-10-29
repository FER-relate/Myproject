#include "colorSpaceConversion.h"
#include <iostream>
#include <fstream>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/imgcodecs/imgcodecs.hpp>
#include <opencv2/xphoto.hpp>
#include "dehaze.h"
#include "enhance.h"
#include "localColorCorrection.h"
#include "illumiCorrection.h"

using namespace cv;
using namespace std;

//#define OLD
//#define LIST
//#define NEW
//#define WHITEBALANCE

int main(int argc, char** argv) {
	int beg_no = 0;
#ifdef NEW
	string folder_name = "..//..//..//..//image//img_171021//171021_capture_";
	string filename = folder_name + to_string(beg_no) + ".jpg";
#endif //NEW
#ifdef OLD
	//string folderName = "img_170721_01j";
	string folderName = "img_170724_02j";
	string folder_name = "..//..//..//..//image//" + folderName + "//" + folderName + "_";
	string saveImage = "..//..//..//result//20171018//" + folderName + "_";
	string filename = folder_name + to_string(beg_no) + ".jpg";
#endif//OLD
#ifdef LIST
	ifstream image_file;
	image_file.open("list//list_out.txt", ios::in);
	vector<string> image_list;
	while (!image_file.eof()) {
		string image_name;
		getline(image_file, image_name);
		if (image_name.length() == 0) break;
		image_list.push_back(image_name);
	}
	image_file.close();
	string filename = image_list[beg_no];
#endif //LIST

	
	//string filename = "..//..//image//light_30_p-2017-06-14.png";
	string filename = "..//..//image//10.jpg";
	//string filename = "city.png";
	Mat image = imread(filename);
	Mat res,res1;
	Mat L, R;
	Mat V,image_hsv;
	//Mat gray;
	//cvtColor(image, gray, CV_BGR2GRAY);
	/*Scalar mean_gray = mean(gray);
	Mat gray_diff = gray - mean_gray[0];
	threshold(gray_diff, gray_diff, 5,255,THRESH_BINARY);*/
	Scalar means, stddevs;
	meanStdDev(image,means,stddevs);
	cout << "means" << means << endl;
	cout << "stddev" << stddevs << endl;
	//medianBlur(image, image, 5);
	//localColorCorrection(image, res);
	
	//dehazeMY(image, res);
	//illumiCorrection(image, res);

#ifdef WHITEBALANCE
	Ptr<xphoto::WhiteBalancer>wb;
	wb = xphoto::createSimpleWB();
	wb->balanceWhite(image, res);
#endif //WHITEBALANCE
	//dehaze(image, res1);
	//dehazeMY(res, res1);
	enhance(image, res1);
	//dehazeDC(image, res);
	//res= L.mul(R);
	//normalize(res, res, 0, 1, NORM_MINMAX, -1, Mat());
	imwrite("dehaze10ehance.jpg", res1);
	//imshow("whitebalance", res);
	imshow("res", res1);
	waitKey(0);

}

