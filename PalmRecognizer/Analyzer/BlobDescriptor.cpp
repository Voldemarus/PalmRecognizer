//
//  BlobDescriptor.cpp
//  PalmRecognizer
//
//  Created by Водолазкий В.В. on 19/05/2019.
//  Copyright © 2019 Geomatix Laboratory S.R.O. All rights reserved.
//

#include <stdio.h>

#include "BlobDescriptor.h"

BlobDescriptor::BlobDescriptor(const cv::Mat &normalizedHistogram, const cv::Mat &keypointDescriptors, uint32_t label)
: normalizedHistogram(normalizedHistogram)
, keypointDescriptors(keypointDescriptors)
, label(label)
{
}

const cv::Mat &BlobDescriptor::getNormalizedHistogram() const {
	return normalizedHistogram;
}

const cv::Mat &BlobDescriptor::getKeypointDescriptors() const {
	return keypointDescriptors;
}

uint32_t BlobDescriptor::getLabel() const {
	return label;
}
