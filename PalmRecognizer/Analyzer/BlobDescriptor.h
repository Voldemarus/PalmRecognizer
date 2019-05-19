//
//  BlobDescriptor.h
//  PalmRecognizer
//
//  Created by Водолазкий В.В. on 19/05/2019.
//  Copyright © 2019 Geomatix Laboratory S.R.O. All rights reserved.
//

#ifndef BlobDescriptor_h
#define BlobDescriptor_h

#include <opencv2/core.hpp>

class BlobDescriptor
{
public:
	BlobDescriptor(const cv::Mat &normalizedHistogram,
				   const cv::Mat &keypointDescriptors, uint32_t label);
	const cv::Mat &getNormalizedHistogram() const;
	
	const cv::Mat &getKeypointDescriptors() const;
	
	uint32_t getLabel() const;
	
private:
	cv::Mat normalizedHistogram;
	cv::Mat keypointDescriptors;
	uint32_t label;
	
};

#endif /* BlobDescriptor_h */
