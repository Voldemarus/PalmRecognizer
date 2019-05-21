//
//  ImageTableViewCell.m
//  PalmRecognizer
//
//  Created by Водолазкий В.В. on 19/05/2019.
//  Copyright © 2019 Geomatix Laboratory S.R.O. All rights reserved.
//

#import "ImageTableViewCell.h"

@interface ImageTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imView;
@property (weak, nonatomic) IBOutlet UILabel *fileName;
@property (weak, nonatomic) IBOutlet UILabel *className;
@property (weak, nonatomic) IBOutlet UILabel *correlation;

@end

@implementation ImageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
	self.identifier = @"Non identified";
	self.correlation.text = @"---";
}

- (void) setImage:(UIImage *)image
{
	self.imView.image = image;
}

- (void) setParameter:(double)parameter
{
	self.correlation.text = [NSString stringWithFormat:@"%f.1",parameter];
}

- (void) setIdentifier:(NSString *)identifier
{
	self.className.text = identifier;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
	CALayer *imLayer = self.imView.layer;
	imLayer.backgroundColor = [UIColor darkGrayColor].CGColor;
	imLayer.cornerRadius = 5.0;
	imLayer.borderWidth = 2.0;
	if (selected) {
		imLayer.borderWidth = 8.0;
		imLayer.borderColor = [UIColor redColor].CGColor;
	}
	
}

+ (UINib *) cellNib
{
	return [UINib nibWithNibName:[[self class] description] bundle:nil];
}

+ (NSString *) ImageTableViewCellReuseID
{
	return @"ImageCell";
}


@end
