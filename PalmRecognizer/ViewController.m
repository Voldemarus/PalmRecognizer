//
//  ViewController.m
//  PalmRecognizer
//
//  Created by Водолазкий В.В. on 19/05/2019.
//  Copyright © 2019 Geomatix Laboratory S.R.O. All rights reserved.
//

#import "ViewController.h"
#import "ImageList.h"
#import "ImageTableViewCell.h"
#import "ImageObjectCollectionViewCell.h"


#import "BlobProcessor.h"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>
{
	NSArray <ImageObject *> *imList;
	NSArray <ImageObject *> *templateList;
	NSArray <NSString *> *identifiers;
	NSInteger selectedIndex;
	NSMutableArray <NSNumber *> *distanceArray;
	NSMutableDictionary *recognizedData;
	
	CGSize cellSzie;
	
}
@property (weak, nonatomic) IBOutlet UICollectionView *cv;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	imList =[ImageList sharedInstance].images;
	templateList = [ImageList sharedInstance].templates;
//	identifiers = [ImageList sharedInstance].identifiers;
	distanceArray = [NSMutableArray new];
	recognizedData = [NSMutableDictionary new];
	selectedIndex = -1;
	
//	[self.tv registerNib:[ImageTableViewCell cellNib] forCellReuseIdentifier:[ImageTableViewCell ImageTableViewCellReuseID]];
	
	[self.cv registerNib:[ImageObjectCollectionViewCell cellNib] forCellWithReuseIdentifier:ImageObjectCellReusableID];

	
}


#pragma mark - Collection View Delegate


- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
	return templateList.count;
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
	ImageObject *template = templateList[section];
	NSArray *list = recognizedData[template];
	if (list) {
		return list.count;
	}
	return 0;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
	ImageObjectCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ImageObjectCellReusableID forIndexPath:indexPath];
	ImageObject *template = templateList[indexPath.section];
	NSArray *list = recognizedData[template];
	cell.imageObject = list[indexPath.row];
	return cell;
}



#pragma mark -

- (void) recalculateDataModel
{
	BlobProcessor *procesor = [BlobProcessor sharedInstance];
	
	// configure processor to use selected image as reference
	//	[procesor configureForIndex:selectedIndex];
	
	[distanceArray removeAllObjects];
	for (NSInteger i = 0; i < imList.count; i++) {
		double result = [procesor distanceBetweenItem:selectedIndex andItem:i];
		NSLog(@" %ld -> %ld ==> %.3f",selectedIndex, i, result);
		[distanceArray addObject:@(result)];
	}
}


@end
