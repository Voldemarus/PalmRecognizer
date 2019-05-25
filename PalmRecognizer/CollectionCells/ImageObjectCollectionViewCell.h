//
//  ImageObjectCollectionViewCell.h
//  PalmRecognizer
//
//  Created by Водолазкий В.В. on 24/05/2019.
//  Copyright © 2019 Geomatix Laboratory S.R.O. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageList.h"


@interface ImageObjectCollectionViewCell : UICollectionViewCell

@property (nonatomic, retain) ImageObject *imageObject;
@property (nonatomic) NSInteger recognizedClass;
@property (nonatomic) NSInteger expectedClass;
@property (readonly) BOOL validClass;

+ (CGSize) itemSize;

@end

