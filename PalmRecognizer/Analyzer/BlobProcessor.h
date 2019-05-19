//
//  BlobProcessor.h
//  PalmRecognizer
//
//  Created by Водолазкий В.В. on 19/05/2019.
//  Copyright © 2019 Geomatix Laboratory S.R.O. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BlobProcessor : NSObject

+ (BlobProcessor *) sharedInstance;

/**
 	Configure processor to use image with index i in ImageList
 	as reference.
 */
- (void) configureForIndex:(NSInteger) aIndex;

@end

NS_ASSUME_NONNULL_END
