//
//  ImageList.m
//  PalmRecognizer
//
//  Created by Водолазкий В.В. on 19/05/2019.
//  Copyright © 2019 Geomatix Laboratory S.R.O. All rights reserved.
//

#import "ImageList.h"

#import "ImageList+ImageDataList.h"


@interface ImageList() {
	NSMutableArray *images;
	NSMutableArray *templateImages;
	NSMutableArray *identifiers;
	NSMutableDictionary *classToId;
}

@end

@implementation ImageList

@synthesize images = images;
@synthesize templates = templateImages;

+ (ImageList *) sharedInstance
{
	static ImageList * __imList = nil;
	if (!__imList) {
		__imList = [[ImageList alloc] init];
	}
	return __imList;
}



- (NSArray <NSString *> *) identifiers
{
	return identifiers;
}

- (instancetype) init
{
	if (self = [super init]) {
		images = [NSMutableArray new];
		templateImages = [NSMutableArray new];
		classToId = [NSMutableDictionary new];
		identifiers = [NSMutableArray new];
		// create templates
		NSArray *dataSource = [self imageSet];
		NSInteger classIndex = 0;
		for (NSInteger i = 0; i < dataSource.count; i++) {
			NSArray *data = dataSource[i];
			NSString *fileName = data[0];
			NSString *className = data[1];
			ImageObject *obj = [[ImageObject alloc] initWithFileName:fileName];
			if (className.length == 0) {
				// this is class definition - use filename as
				// its name
				NSString *clName = [fileName stringByDeletingLastPathComponent];
				obj.classNumber = classIndex++;
				classToId[clName] = @(obj.classNumber);
				obj.expectedClassNumber = -1;
				[templateImages addObject:obj];
			} else {
				// this is a record for testing
				obj.classNumber = -1;
				NSNumber *index = classToId[className];
				// we'll add only images with known class for now
				if (index) {
					obj.expectedClassNumber = index.integerValue;
					[images addObject:obj];
				}
			}
		}
		NSLog(@"Templates: \n%@\n", templateImages);
		NSLog(@"images:\n%@\n",images);
	}
	return self;
}

#pragma mark -

@end

@interface ImageObject () {
	UIImage *__image;
}

@end

@implementation ImageObject

- (instancetype) initWithFileName:(NSString *)fileName
{
	if (self = [super init]) {
		__image = [UIImage imageNamed:fileName];
	}
	return self;
}

- (UIImage *)image
{
	return __image;
}
		

@end
