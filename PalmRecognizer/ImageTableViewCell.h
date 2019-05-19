//
//  ImageTableViewCell.h
//  PalmRecognizer
//
//  Created by Водолазкий В.В. on 19/05/2019.
//  Copyright © 2019 Geomatix Laboratory S.R.O. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageTableViewCell : UITableViewCell

@property (nonatomic, retain) UIImage *image;
@property (nonatomic, retain) NSString *identifier;
@property (nonatomic) double parameter;

+ (UINib *) cellNib;
+ (NSString *) ImageTableViewCellReuseID;

@end

NS_ASSUME_NONNULL_END
