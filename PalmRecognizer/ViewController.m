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


#import "BlobProcessor.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
{
	NSArray <UIImage *> *imList;
	NSArray <NSString *> *identifiers;
	NSInteger selectedIndex;
	NSMutableArray <NSNumber *> *distanceArray;
	
}

@property (weak, nonatomic) IBOutlet UITableView *tv;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	imList =[ImageList sharedInstance].images;
	identifiers = [ImageList sharedInstance].identifiers;
	distanceArray = [NSMutableArray new];
	selectedIndex = -1;
	
	[self.tv registerNib:[ImageTableViewCell cellNib] forCellReuseIdentifier:[ImageTableViewCell ImageTableViewCellReuseID]];
}


#pragma mark - TableView Delegate

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return imList.count;
}

- (__kindof  UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	ImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[ImageTableViewCell ImageTableViewCellReuseID]];
	cell.image = imList[indexPath.row];
	if (selectedIndex >= 0) {
		cell.parameter = distanceArray[indexPath.row].doubleValue;
	} else {
		cell.parameter = 10000.0;
	}
	BOOL isSelected = (indexPath.row == selectedIndex);
	cell.accessoryType = (isSelected ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone);
	
	return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 100.0;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	selectedIndex = indexPath.row;
	NSLog(@"selectedIndex = %ld",(long)selectedIndex);
	UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
	[cell setSelected:YES];
	[self recalculateDataModel];
	[tableView reloadData];
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
