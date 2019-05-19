//
//  BlobDetector.h
//  PalmRecognizer
//
//  Created by Водолазкий В.В. on 19/05/2019.
//  Copyright © 2019 Geomatix Laboratory S.R.O. All rights reserved.
//

#ifndef BlobDetector_h
#define BlobDetector_h

#include <opencv2/core.hpp>

class BlobDetector
{
public:
	void detect(cv::Mat &image, std::vector <Blob> &blob,
				double resizeFactor = 1.0, bool draw = false);
	
	const cv::Mat &getMask() const;
private:
	void createMask( const cv::Mat &image);
	
	cv::Mat resizedImage;
	cv::Mat mask;
	CV::Mat edges;
	std::vector <cv::Point> contours;
	std::vector<cv::Vec4i> hierarchy;
	
	
}

#endif /* BlobDetector_h */
