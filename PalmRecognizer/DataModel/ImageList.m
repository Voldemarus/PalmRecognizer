//
//  ImageList.m
//  PalmRecognizer
//
//  Created by Водолазкий В.В. on 19/05/2019.
//  Copyright © 2019 Geomatix Laboratory S.R.O. All rights reserved.
//

#import "ImageList.h"

@interface ImageList() {
	NSMutableArray *images;
	NSMutableArray *identifiers;
}

@end

@implementation ImageList

@synthesize images = images;

+ (ImageList *) sharedInstance
{
	static ImageList * __imList = nil;
	if (!__imList) {
		__imList = [[ImageList alloc] init];
	}
	return __imList;
}

- (NSArray <NSString *> *) idents
{
	static NSArray <NSString *> *__idents = nil;
	if (!__idents) {
		__idents =  @[
			@"5_1558129955.jpg",
			@"5_1558194232.jpg",
			@"5_1558130295.jpg",
			@"5_1558130079.jpg",
			@"5_1558194308.jpg",
			@"5_1558193865.jpg",
			@"5_1558194105.jpg",
			@"5_1558193642.jpg",
			@"5_1558130299.jpg",
			@"5_1558193733.jpg",
			@"5_1558130014.jpg",
			@"5_1558194039.jpg",
			@"5_1558193803.jpg",
			@"5_1558194163.jpg",
			@"5_1558193584.jpg",
		];
	}
	return __idents;
}

- (NSArray <NSString *> *) identifiers
{
	return identifiers;
}

- (instancetype) init
{
	if (self = [super init]) {
		images = [NSMutableArray new];
		identifiers = [NSMutableArray new];
		NSArray *imageNames = [self idents];
		for (NSString *s in imageNames) {
			UIImage *image = [UIImage imageNamed:s];
			if (s) {
				[images addObject:image];
				[identifiers addObject:s];
			}
		}
		
	}
	return self;
}



@end
