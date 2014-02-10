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
#import "RGConfigData.h"


static NSString * const ItemCellIdentifier = @"ItemCell";


@interface RGTableViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) RGArrayDataSource *itemsArrayDataSource;

@end


@implementation RGTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
}


/////////////////////////////////////////////////////////////////////////////////////////////
# pragma mark - Private

- (void)setupTableView {
    TableViewCellConfigureBlock configureCell = ^(RGItemCell *cell, RGObject *item) {
        [cell configureForItem:item];
    };

    NSString *myTitle = self.levelDescription;
    
    // for the initial level, get the description from the config sheet in the database; for others, it's set by the parent table view controller
    if (!myTitle) {
        NSArray *allConfigData = [[[RGFeedManager sharedRGFeedManager] metadataEntries] filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"configItem=0"]];
        if ([allConfigData count] > 0)
            myTitle = ((RGConfigData *)allConfigData[0]).configValue;
    }

    self.navigationItem.title = myTitle;

    if (self.parentId != 0) {
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
    RGObject *obj = [self.itemsArrayDataSource itemAtIndexPath:indexPath];
    if ([obj.numberOfSubentries isEqualToNumber:@0]) {
        return;
    }
    
    
    RGTableViewController *tvc = [self.storyboard instantiateViewControllerWithIdentifier:@"RGTableViewController"];
    NSAssert([tvc isKindOfClass:[RGTableViewController class]], @"expected TVC");

    tvc.parentId = obj.itemId;
    tvc.levelDescription = obj.nextLevel;

    [self.navigationController pushViewController:tvc animated:YES];
}

@end
