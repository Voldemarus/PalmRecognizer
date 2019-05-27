//
//  ImageObjectTemplateView.m
//  PalmRecognizer
//
//  Created by Водолазкий В.В. on 26/05/2019.
//  Copyright © 2019 Geomatix Laboratory S.R.O. All rights reserved.
//

#import "ImageObjectTemplateView.h"

NSString * const ImageObjectTemplateViewReusableId = @"ImageObjectTemplateViewReusableId";

@interface ImageObjectTemplateView () 
@property (weak, nonatomic) IBOutlet UIImageView *templateImage;
@property (weak, nonatomic) IBOutlet UILabel *precisionLabel;
@property (weak, nonatomic) IBOutlet UILabel *expectedLabel;
@property (weak, nonatomic) IBOutlet UILabel *templateNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *properLabel;
@property (weak, nonatomic) IBOutlet UILabel *falseAlertLabel;
@property (weak, nonatomic) IBOutlet UILabel *missedTargetLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalErrorsLabel;

@end


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
	self.templateImage.image = _templateObject.image;
	self.templateNameLabel.text = [NSString stringWithFormat:@"Class #%ld", (long)_templateObject.classNumber];
}


+ (UINib *) cellNib
{
	return [UINib nibWithNibName:[[self class] description] bundle:nil];
}


@end
