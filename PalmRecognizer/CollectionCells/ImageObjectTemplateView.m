//
//  ImageObjectTemplateView.m
//  PalmRecognizer
//
//  Created by Водолазкий В.В. on 26/05/2019.
//  Copyright © 2019 Geomatix Laboratory S.R.O. All rights reserved.
//

#import "ImageObjectTemplateView.h"

NSString * const ImageObjectTemplateViewReusableId = @"ImageObjectTemplateViewReusableId";

@implementation ImageObjectTemplateView

- (instancetype) initWithFrame:(CGRect)frame
{
	if (self = [super initWithFrame:frame]) {
		
	}
	return self;
}


- (void) setTemplateObject:(ImageObject *)templateObject
{
	_templateObject = templateObject;
}

@end
