//
//  Blob.h
//  PalmRecognizer
//
//  Created by Водолазкий В.В. on 19/05/2019.
//  Copyright © 2019 Geomatix Laboratory S.R.O. All rights reserved.
//

#ifndef Blob_h
#define Blob_h

#include <opencv2/core.hpp>

class Blob
{
public:
	Blob(const cv::Mat &mat, uint32_t label = 0ul);
	
	/**
	 Create empty blob
	 */
	Blob();
	
	/**
	 Construct Blob as copy of another Blob
	 */
	Blob(const Blob &other);
	
	bool isEmpty() const;
	
	uint32_t getLabel() const;
	
	void setLabel(uint32_t value);
	
	const cv::Mat &getMat() const;
	
	int getWidth() const;
	
	int getHeight() const;
	
private:
	
	uint32_t label;
	cv::Mat mat;
	
};

#endif /* Blob_h */
