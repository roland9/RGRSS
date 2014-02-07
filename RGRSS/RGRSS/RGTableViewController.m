//
//  RGTableViewController.m
//  RGRSS
//
//  Created by Roland on 07/02/2014.
//  Copyright (c) 2014 RG. All rights reserved.
//

#import "RGTableViewController.h"
#import "RGArrayDataSource.h"
#import "RGFeedManager.h"
#import "RGItemCell.h"
#import "RGItemCell+ConfigureForItem.h"
#import "RGObject.h"


static NSString * const ItemCellIdentifier = @"ItemCell";


@interface RGTableViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) RGArrayDataSource *itemsArrayDataSource;

@end


@implementation RGTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *urlString = @"http://spreadsheets.google.com/feeds/list/0Apmsn6hlyPHudDBHbWJ6NkI4SFNwTEkzQVBXS3VGY0E/od6/public/values?alt=json";
    NSURL *url = [NSURL URLWithString:urlString];
    [[RGFeedManager sharedRGFeedManager] loadURL:url];

    self.navigationItem.title = @"Items";
    [self setupTableView];
}


/////////////////////////////////////////////////////////////////////////////////////////////
# pragma mark - Private

- (void)setupTableView {
    TableViewCellConfigureBlock configureCell = ^(RGItemCell *cell, RGObject *item) {
        [cell configureForItem:item];
    };
    
#warning handle async setup
    double delayInSeconds = 5.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        NSArray *items = [[RGFeedManager sharedRGFeedManager] responseEntries];
        
        self.itemsArrayDataSource = [[RGArrayDataSource alloc] initWithItems:items
                                                              cellIdentifier:ItemCellIdentifier
                                                          configureCellBlock:configureCell];
        self.tableView.dataSource = self.itemsArrayDataSource;
        [self.tableView registerNib:[RGItemCell nib] forCellReuseIdentifier:ItemCellIdentifier];
        [self.tableView reloadData];
    });
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    PhotoViewController *photoViewController = [[PhotoViewController alloc] initWithNibName:@"PhotoViewController"
//                                                                                     bundle:nil];
//    photoViewController.photo = [self.photosArrayDataSource itemAtIndexPath:indexPath];
//    [self.navigationController pushViewController:photoViewController animated:YES];
}

@end
