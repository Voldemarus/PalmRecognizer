//
//  ImageObjectCollectionViewCell.m
//  PalmRecognizer
//
//  Created by Водолазкий В.В. on 24/05/2019.
//  Copyright © 2019 Geomatix Laboratory S.R.O. All rights reserved.
//

#import "ImageObjectCollectionViewCell.h"


NSString * const ImageObjectCellReusableID =	@"ImageObjectCellReusableID";

#define CELL_SIZE_WIDTH			120.0

@interface ImageObjectCollectionViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIView *expecredClassView;
@property (weak, nonatomic) IBOutlet UILabel *expectedClassLabel;
@property (weak, nonatomic) IBOutlet UIView *actualClassView;
@property (weak, nonatomic) IBOutlet UILabel *actualClassLabel;
@property (weak, nonatomic) IBOutlet UIView *auxillaryView;
@property (weak, nonatomic) IBOutlet UILabel *auxillaryLabel;



@end

@implementation ImageObjectCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
	self.expectedClass = -1;
	self.recognizedClass = -1;
	
	CALayer *layer = self.layer;
	layer.borderWidth = 1.0;
	layer.cornerRadius = CELL_SIZE_WIDTH / 10.0;
	layer.borderColor = [UIColor darkGrayColor].CGColor;
	
	self.expectedClassLabel.text = @"?";
	self.expecredClassView.alpha = 0.0;
	CALayer *lec = self.expecredClassView.layer;
	lec.cornerRadius = self.expecredClassView.frame.size.width / 2.0;
	
	self.actualClassView.alpha = 0.0;
	self.actualClassLabel.text = @"?";
	CALayer *lac = self.actualClassView.layer;
	lac.cornerRadius = self.actualClassView.frame.size.width / 2.0;
	
	self.auxillaryView.alpha = 0.0;
	self.auxillaryLabel.text = @"?";
	
}

- (void) setImageObject:(ImageObject *)imageObject
{
	_imageObject = imageObject;
	self.imageView.image = _imageObject.image;
	self.expectedClassLabel.text = [NSString stringWithFormat:@"%ld",(long) _imageObject.expectedClassNumber];
}


- (void) setRecognizedClass:(NSInteger)recognizedClass
{
	_recognizedClass = recognizedClass;
	if (self.validClass) {
		self.actualClassView.backgroundColor = [UIColor greenColor];
	} else {
		self.actualClassView.backgroundColor = [UIColor greenColor];
	}
	self.actualClassView.alpha = 1.0;
	self.actualClassLabel.text = [NSString stringWithFormat:@"%ld", (long) self.recognizedClass];

}



- (BOOL) validClass
{
	return (self.imageObject.expectedClassNumber == self.recognizedClass);
}

#pragma mark -

+ (CGSize) itemSize
{
	return CGSizeMake(CELL_SIZE_WIDTH, CELL_SIZE_WIDTH);
}

+ (UINib *) cellNib
{
	return [UINib nibWithNibName:[[self class] description] bundle:nil];
}

@end
