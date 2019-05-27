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
#import "ImageObjectTemplateView.h"

#import "BlobProcessor.h"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
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
	
//	UICollectionViewLayout *layout = self.cv.collectionViewLayout;
//	layout.itemSize = [ImageObjectCollectionViewCell itemSize];
	
	
	[self.cv registerNib:[ImageObjectCollectionViewCell cellNib] forCellWithReuseIdentifier:ImageObjectCellReusableID];
	
	[self.cv registerNib:[ImageObjectTemplateView cellNib] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ImageObjectTemplateViewReusableId];

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
	return 1;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
	ImageObjectCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ImageObjectCellReusableID forIndexPath:indexPath];
	ImageObject *template = templateList[indexPath.section];
	NSArray *list = recognizedData[template];
	if (list) {
		cell.imageObject = list[indexPath.row];
	} else {
		cell.imageObject = nil;
	}
	return cell;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
	return CGSizeMake(collectionView.frame.size.width, 130.0);
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
	if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
		ImageObjectTemplateView *header = (ImageObjectTemplateView *)[collectionView dequeueReusableCellWithReuseIdentifier:ImageObjectTemplateViewReusableId forIndexPath:indexPath];
		header.templateObject = templateList[indexPath.section];
		return header;
	}
	return [[UICollectionReusableView alloc] initWithFrame:CGRectZero];
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
