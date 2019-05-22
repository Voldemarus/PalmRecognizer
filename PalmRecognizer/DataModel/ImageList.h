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

@interface ImageObject : NSObject

@property (nonatomic, readonly) UIImage *image;		 // image to recognize
@property (nonatomic, readonly) NSString *fileName;	 // filename for image
@property (nonatomic, readonly) NSString *groupName; // filename for template (nil, if this is template

- (instancetype) initWithFileName:(NSString *)fileName inGroup:(NSString *)aGroupName;

@end


@interface ImageList : NSObject

@property (nonatomic, readonly) NSArray <ImageObject *> *images;
@property (nonatomic, readonly) NSArray <NSString *> *identifiers;

+ (ImageList *) sharedInstance;



@end

NS_ASSUME_NONNULL_END
