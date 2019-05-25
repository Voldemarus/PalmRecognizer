//
//  NSString+ImageDataList.h
//  PalmRecognizer
//
//  Created by Водолазкий В.В. on 22/05/2019.
//  Copyright © 2019 Geomatix Laboratory S.R.O. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImageList.h"

/**
 ImageSet entry is NSArray with rows:
 
 @imageFileName, @imageGroupName
 
 */

@interface ImageList (ImageDataList)

- (NSArray *) imageSet;

@end
