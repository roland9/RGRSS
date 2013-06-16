//
//  RGItemsTVC.m
//  RGRSS
//
//  Created by Roland on 16/06/2013.
//  Copyright (c) 2013 RG. All rights reserved.
//

#import "RGItemsTVC.h"
#import "RGDetailViewController.h"
//#import "FPParser.h"
//#import "FPFeed.h"
#import "RGChannel.h"
#import "DDLog.h"


#ifdef DEBUG
static const int ddLogLevel = LOG_LEVEL_INFO;
#else
static const int ddLogLevel = LOG_LEVEL_ERROR;
#endif


@interface RGItemsTVC ()
@end


@implementation RGItemsTVC


/////////////////////////////////////////////////////////////////////////////////////////////
# pragma mark - RGBaseFRCProtocol - Fetched results controller & Table View

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        NSManagedObject *object = [[self fetchedResultsController] objectAtIndexPath:indexPath];
        self.detailViewController.detailItem = object;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSManagedObject *object = [[self fetchedResultsController] objectAtIndexPath:indexPath];
        [[segue destinationViewController] setDetailItem:object];
    }
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        RGChannel *object = [[self fetchedResultsController] objectAtIndexPath:indexPath];
//        NSAssert([object isKindOfClass:[RGChannel class]], @"wrong class");
//        
//        RGItemsTVC *destinationVC = [segue destinationViewController];
//        NSAssert([destinationVC isKindOfClass:[RGItemsTVC class]], @"wrong class");
//        [destinationVC setChannel:object];
    }
}

- (NSArray *)sortDescriptors {
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"pubDate" ascending:NO];
    return @[sortDescriptor];
}

- (NSString *)entityName {
    return @"RGItem";
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    NSManagedObject *object = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = [[object valueForKey:@"title"] description];
}


/////////////////////////////////////////////////////////////////////////////////////////////
# pragma mark - Object Life Cycle

- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    }
    [super awakeFromNib];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    //    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    //    self.navigationItem.rightBarButtonItem = addButton;
    self.detailViewController = (RGDetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
