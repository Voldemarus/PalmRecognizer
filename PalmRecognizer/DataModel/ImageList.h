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
@property (nonatomic) NSInteger classNumber;		// -1 if derived, >= 0 if template
@property (nonatomic) NSInteger expectedClassNumber; // -1 if template, >=0 if derived

- (instancetype) initWithFileName:(NSString *)fileName;

@end


@interface ImageList : NSObject

// Template objects
@property (nonatomic, readonly) NSArray <ImageObject *> *templates;
// Test objects
@property (nonatomic, readonly) NSArray <ImageObject *> *images;
//@property (nonatomic, readonly) NSArray <NSString *> *identifiers;

+ (ImageList *) sharedInstance;



@end

NS_ASSUME_NONNULL_END
