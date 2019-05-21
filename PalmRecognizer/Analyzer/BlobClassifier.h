//
//  BlobClasifier.h
//  PalmRecognizer
//
//  Created by Водолазкий В.В. on 19/05/2019.
//  Copyright © 2019 Geomatix Laboratory S.R.O. All rights reserved.
//

#ifndef BlobClassifier_h
#define BlobClassifier_h

#import "Blob.h"
#import "BlobDescriptor.h"
#include "opencv2/features2d.hpp"

class BlobClassifier
{
public:
	BlobClassifier();
	
	/**
	 	Add reference blob to the Classifier model
	 */
	void update(const Blob &referenceBlob);
	
	/**
	 	Reset classifier model
	 */
	void clear();
	
	/**
	 	Classify blob
	 */
	void classify(Blob &detectedBlob) const;
	
	/**
	 	Get distance between two Blobs
	 */
	float distanceBetweenBlobs(const Blob &blobA, const Blob &blobB);
	
	
private:
	
	BlobDescriptor createBlobDescriptor(const Blob &blob) const;
	
	float findDistance(const BlobDescriptor &detectedBlobDescriptor, const BlobDescriptor &referenceBlobDescriptor) const;
	
	/**
	 Adaptive equalizer - local contrast
	 */
	cv::Ptr<cv::CLAHE> clahe;
	
	/**
	 	Feature detector and descriptor extractor
	 */
	cv::Ptr <cv::Feature2D> featureDetectorAndDescriptorExtractor;
	
	/**
	 Descriptor comparator
	*/
	cv::Ptr<cv::DescriptorMatcher> descriptorMatcher;
	
	/** Array with Reference descriptors */
	
	std::vector <BlobDescriptor> referenceBlobDescriptors;
};


#endif /* BlobClasifier_h */
