//
//  RGMasterViewController.m
//  RGRSS
//
//  Created by Roland on 01/06/2013.
//  Copyright (c) 2013 RG. All rights reserved.
//

#import "RGMasterViewController.h"

#import "RGDetailViewController.h"
#import "FPParser.h"
#import "FPFeed.h"
#import "RGChannel.h"
#import "RGItemsTVC.h"
#import "RGFeedManager.h"
#import "DDLog.h"

#ifdef DEBUG
static const int ddLogLevel = LOG_LEVEL_INFO;
#else
static const int ddLogLevel = LOG_LEVEL_ERROR;
#endif


@interface RGMasterViewController ()
@property (nonatomic, retain) RGChannel *channel;
@end


@implementation RGMasterViewController

/////////////////////////////////////////////////////////////////////////////////////////////
# pragma mark - RGBaseFRCProtocol - Fetched results controller & Table View

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
//        NSManagedObject *object = [[self fetchedResultsController] objectAtIndexPath:indexPath];
//        NSAssert([object isKindOfClass:[RGChannel class]], @"wrong class");
//        _channel = (RGChannel *)object;
//    }
//}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showItems"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        RGChannel *object = [[self fetchedResultsController] objectAtIndexPath:indexPath];
        NSAssert([object isKindOfClass:[RGChannel class]], @"wrong class");
        
        RGItemsTVC *destinationVC = [segue destinationViewController];
        NSAssert([destinationVC isKindOfClass:[RGItemsTVC class]], @"wrong class");
        [destinationVC setChannel:object];
    }
}

- (NSArray *)sortDescriptors {
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"pubDate" ascending:NO];
    return @[sortDescriptor];
}

- (NSString *)entityName {
    return @"RGChannel";
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    NSManagedObject *object = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = [[object valueForKey:@"title"] description];
}


/////////////////////////////////////////////////////////////////////////////////////////////
# pragma mark - Object Life Cycle

- (void)initDataSample:(NSString *)fileName type:(NSString *)type
{
    NSString *inputFile = [[NSBundle mainBundle] pathForResource:fileName ofType:type];
    NSAssert(inputFile, @"could not find RSS input file");
    //    NSInputStream *inputStream = [[NSInputStream alloc] initWithFileAtPath:inputFile];
    NSData *inputData = [NSData dataWithContentsOfFile:inputFile];
    
    NSError *error = nil;
    FPFeed *feed = [FPParser parsedFeedWithData:inputData error:&error];
    
    NSAssert(feed, @"feed empty");
    
    __block RGChannel *appFeed = nil;
    [MagicalRecord saveWithBlockAndWait:^(NSManagedObjectContext *localContext) {
        
        NSString *feedTitle = [feed title];
        appFeed = [RGChannel feedWithName:feedTitle inContext:localContext];
        [appFeed MR_importValuesForKeysWithObject:feed];
        
    }];
    
    NSLog(@"done");
}


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
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    //    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    //    self.navigationItem.rightBarButtonItem = addButton;
    
    [self initDataSample:@"rss2sample.xml" type:@"rss"];
    [self initDataSample:@"spiegelIndex" type:@"rss"];
    
//    [self createDummyChannel];
    [[RGFeedManager sharedRGFeedManager] reloadAllChannels];
}


- (void)createDummyChannel {
    RGChannel *newChannel = [RGChannel MR_createInContext:[NSManagedObjectContext MR_contextForCurrentThread]];

    newChannel.feedDescription = @"dummy channel";
    newChannel.language = @"English (IE)";
    newChannel.lastBuildDate = [NSDate date];
    newChannel.link = @"http://www.spiegel.de/schlagzeilen/tops/index.rss";
    newChannel.pubDate = [NSDate date];
    newChannel.title = @"My Dummy Channel";
    
    [[NSManagedObjectContext MR_contextForCurrentThread] MR_saveToPersistentStoreAndWait];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
