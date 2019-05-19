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

@interface BlobProcessor()
{
	BlobClassifier *blobClasifier;
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
		blobClasifier = new BlobClassifier();
	}
	return self;
}

- (void) configureForIndex:(NSInteger) aIndex
{
	
}




@end
