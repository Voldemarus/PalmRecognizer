//
//  ImageList.h
//  PalmRecognizer
//
//  Created by Водолазкий В.В. on 19/05/2019.
//  Copyright © 2019 Geomatix Laboratory S.R.O. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageList : NSObject
@property (nonatomic, readonly) NSArray <UIImage *> *images;

+ (ImageList *) sharedInstance;



@end

NS_ASSUME_NONNULL_END
