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
#import "RGDataManager.h"
#import "RGObject.h"


static NSString * const ItemCellIdentifier = @"ItemCell";


@interface RGTableViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) RGArrayDataSource *itemsArrayDataSource;

@end


@implementation RGTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"Items";
    [self setupTableView];
}


/////////////////////////////////////////////////////////////////////////////////////////////
# pragma mark - Private

- (void)setupTableView {
    TableViewCellConfigureBlock configureCell = ^(RGItemCell *cell, RGObject *item) {
        [cell configureForItem:item];
    };
    
    // kick off global setup & loading data - once
    self.level = [[RGDataManager sharedRGDataManager] currentLevel];
    self.parentId = [[RGDataManager sharedRGDataManager] selectedParentId];

    if (self.level != 0) {
        NSArray *items = [[RGFeedManager sharedRGFeedManager] itemsWithParentId:self.parentId];
        
        self.itemsArrayDataSource = [[RGArrayDataSource alloc] initWithItems:items
                                                              cellIdentifier:ItemCellIdentifier
                                                          configureCellBlock:configureCell];
        self.tableView.dataSource = self.itemsArrayDataSource;
        [self.tableView registerNib:[RGItemCell nib] forCellReuseIdentifier:ItemCellIdentifier];
        [self.tableView reloadData];
        return;
    }
    
    
#warning handle async setup
    double delayInSeconds = 3.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        NSArray *items = [[RGFeedManager sharedRGFeedManager] itemsWithParentId:self.parentId];
        
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
    RGTableViewController *tvc = [self.storyboard instantiateViewControllerWithIdentifier:@"RGTableViewController"];
    NSAssert([tvc isKindOfClass:[RGTableViewController class]], @"expected TVC");

    RGObject *obj = [self.itemsArrayDataSource itemAtIndexPath:indexPath];
    [[RGDataManager sharedRGDataManager] setSelectedParentId:obj.itemId];
    [[RGDataManager sharedRGDataManager] increasedLevel];
    
//    tvc.parentId = obj.itemId;
//    tvc.itemsArrayDataSource

    [self.navigationController pushViewController:tvc animated:YES];
}

@end
