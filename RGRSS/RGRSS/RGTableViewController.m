//
//  RGTableViewController.m
//  RGRSS
//
//  Created by Roland on 07/02/2014.
//  Copyright (c) 2014 RG. All rights reserved.
//

#import "RGTableViewController.h"
#import "RGDetailViewController.h"
#import "RGArrayDataSource.h"
#import "RGFeedManager.h"
#import "RGItemCell.h"
#import "RGItemCell+ConfigureForItem.h"
#import "RGObject.h"
#import "RGConfigData.h"
#import "DDLog.h"

#ifdef DEBUG
static const int ddLogLevel = LOG_LEVEL_INFO;
#else
static const int ddLogLevel = LOG_LEVEL_ERROR;
#endif


static NSString * const ItemCellIdentifier = @"ItemCell";


@interface RGTableViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) RGArrayDataSource *itemsArrayDataSource;
@property (nonatomic, strong) RGDetailViewController *detailViewController;

@end


@implementation RGTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.detailViewController = (RGDetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    self.splitViewController.delegate = self.detailViewController;
    
    [self setupTableView];
}

- (void)dealloc {
    [[RGFeedManager sharedRGFeedManager] removeObserver:self forKeyPath:@"configDataEntries" context:nil];
}


- (void)awakeFromNib {
    [super awakeFromNib];
    self.parentId = @"0";

    [[RGFeedManager sharedRGFeedManager] addObserver:self forKeyPath:@"configDataEntries" options:NSKeyValueObservingOptionNew context:nil];
}


/////////////////////////////////////////////////////////////////////////////////////////////
# pragma mark - Private

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    DDLogInfo(@"%s: keyPath=%@", __FUNCTION__, keyPath);
    
    if ([keyPath isEqualToString:@"configDataEntries"]) {
        DDLogInfo(@"%s", __FUNCTION__);
        
        NSArray *initialLevelConfig = [[[RGFeedManager sharedRGFeedManager] configDataEntries] filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"%K = %@", @"configItem", @"InitialLevel"]];
        if ([initialLevelConfig count] > 0)
        self.navigationItem.title = ((RGConfigData *)initialLevelConfig[0]).configValue;
    }
}


- (void)setupTableView {
    [self.tableView registerNib:[RGItemCell nib] forCellReuseIdentifier:[self cellIdentifier]];

    // kick off data loading
    [RGFeedManager sharedRGFeedManager];

    // for the initial level, get the description from the config sheet in the database (use KVO to find out when it's available); for others, it's set by the parent table view controller
    NSString *myTitle = self.levelDescription;
    self.navigationItem.title = myTitle;
    
}


/////////////////////////////////////////////////////////////////////////////////////////////
# pragma mark - RGBaseFRCProtocol - Fetched results controller & Table View

- (NSArray *)sortDescriptors {
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"itemDescription" ascending:YES];
    return @[sortDescriptor];
}

- (NSString *)entityName {
    return @"RGObject";
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    NSManagedObject *object = [self.fetchedResultsController objectAtIndexPath:indexPath];
    NSAssert([object isKindOfClass:[RGObject class]], @"expected RGObject");
    NSAssert([cell isKindOfClass:[RGItemCell class]], @"expected RGItemCell");
    
    [(RGItemCell *)cell configureForItem:(RGObject *)object];
}

- (NSString *)cellIdentifier {
    return ItemCellIdentifier;
}

- (NSPredicate *)predicate {
    return [NSPredicate predicateWithFormat:@"parentId = %@", self.parentId];
}


#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RGObject *obj = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    if ([obj.numberOfSubentries unsignedIntegerValue] > 0) {
        // we have usbentries -> navigate to next level list
        RGTableViewController *tvc = [self.storyboard instantiateViewControllerWithIdentifier:@"RGTableViewController"];
        NSAssert([tvc isKindOfClass:[RGTableViewController class]], @"expected TVC");
        
        tvc.parentId = obj.itemId;
        tvc.levelDescription = obj.nextLevel;
        
        [self.navigationController pushViewController:tvc animated:YES];
        
    } else if ([obj.numberOfSubentries unsignedIntegerValue] == 0  &&
               [obj.detailHTML length] > 0) {
        
        // we don't have subentries, but we have detailHTML info -> show html in detailVC
        
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            [self.detailViewController setDetailItem:@{@"title": obj.itemDescription, @"html": obj.detailHTML}];

        } else {
            RGDetailViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"RGDetailViewController"];
            NSAssert([detailVC isKindOfClass:[RGDetailViewController class]], @"inconsistent storyboard");
            
            [detailVC setDetailItem:@{@"title": obj.itemDescription, @"html": obj.detailHTML}];
            [self.navigationController pushViewController:detailVC animated:YES];
        }
        
    } else if ([obj.articleLink length] > 0) {
        
        // we don't have subentries or detailHTML, but we have a hyperlink to an article
        
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            [self.detailViewController setDetailItem:@{@"title": obj.itemDescription, @"link": obj.articleLink}];
            
        } else {
            RGDetailViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"RGDetailViewController"];
            NSAssert([detailVC isKindOfClass:[RGDetailViewController class]], @"inconsistent storyboard");
            
            [detailVC setDetailItem:@{@"title": obj.itemDescription, @"link": obj.articleLink}];
            [self.navigationController pushViewController:detailVC animated:YES];
        }
    }
}

@end
