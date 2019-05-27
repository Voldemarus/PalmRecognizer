//
//  ImageObjectTemplateView.h
//  PalmRecognizer
//
//  Created by Водолазкий В.В. on 26/05/2019.
//  Copyright © 2019 Geomatix Laboratory S.R.O. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ImageList.h"

extern NSString * const ImageObjectTemplateViewReusableId;

@interface ImageObjectTemplateView : UICollectionReusableView

@property (nonatomic, retain) ImageObject *templateObject;

@end


