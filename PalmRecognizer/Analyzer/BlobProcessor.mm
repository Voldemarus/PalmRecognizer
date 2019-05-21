//
//  BlobProcessor.m
//  PalmRecognizer
//
//  Created by Водолазкий В.В. on 19/05/2019.
//  Copyright © 2019 Geomatix Laboratory S.R.O. All rights reserved.
//

#import "BlobProcessor.h"


#import "BlobClassifier.h"
#import "BlobDetector.h"

#import <opencv2/imgcodecs/ios.h>


#import "ImageList.h"

@interface BlobProcessor()
{
	BlobClassifier *blobClassifier;
	BlobDetector *blobDetector;
	std::vector<Blob> detectedBlobs;
	
}
@end

@implementation BlobProcessor

+ (BlobProcessor *) sharedInstance
{
	static BlobProcessor *__processor;
	if (!__processor) {
		__processor = [[BlobProcessor alloc] init];
	}
	return __processor;
}

- (instancetype) init
{
	if (self = [super init]) {
		blobDetector = new BlobDetector();
		blobClassifier = new BlobClassifier();
	}
	return self;
}

/**
 	To be used later - to create configuration with single object
 
 
 
 */
- (void) configureForIndex:(NSInteger) aIndex
{
	
}

- (double) distanceBetweenItem:(NSInteger) itemA andItme:(NSInteger) itemB
{
	NSArray <UIImage *> *imList = [ImageList sharedInstance].images;
	UIImage *imageA = imList[itemA];
	UIImage *imageB = imList[itemB];
	Blob blobA = [self blobFromImage:imageA withIndex:itemA];
	Blob blobB = [self blobFromImage:imageB withIndex:itemB];
	
	return blobClassifier->distanceBetweenBlobs(blobA, blobB);
}

- (Blob) blobFromImage:(UIImage *)image withIndex:(NSInteger) index
{
	cv::Mat mat;
	UIImageToMat(image, mat);
	uint32_t label = (uint32_t)index;
	Blob blob(mat,label);
	return blob;
}


@end
