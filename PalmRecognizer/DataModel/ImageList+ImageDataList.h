//
//  NSString+ImageDataList.h
//  PalmRecognizer
//
//  Created by Водолазкий В.В. on 22/05/2019.
//  Copyright © 2019 Geomatix Laboratory S.R.O. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 ImageSet entry is NSArray with rows:
 
 @imageFileName, @imageGroupName
 
 */

@interface NSString (ImageDataList)

- (NSArray *) imageSet;

@end

NS_ASSUME_NONNULL_END
