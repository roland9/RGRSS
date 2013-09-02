//
//  RGRSSTests.m
//  RGRSSTests
//
//  Created by Roland on 01/06/2013.
//  Copyright (c) 2013 RG. All rights reserved.
//

#import "RGRSSTests.h"
//#import <BlockRSSParser/RSSParser.h>
#import "FeedParser.h"
#import "FPParser.h"
#import "RGChannel.h"
#import "RGItem.h"
#import <CoreData+MagicalRecord.h>
#import "DDLog.h"

#ifdef DEBUG
static const int ddLogLevel = LOG_LEVEL_INFO;
#else
static const int ddLogLevel = LOG_LEVEL_ERROR;
#endif


@implementation RGRSSTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    [self wipeAllChannelsAndItems];
}

- (void)tearDown
{
    // Tear-down code here.
    [self wipeAllChannelsAndItems];

    [super tearDown];
}

- (void)testReadRSSSample
{
    NSString *inputFileName = [[NSBundle mainBundle] pathForResource:@"rss2sample.xml" ofType:@"rss"];
    STAssertNotNil(inputFileName, @"could not find RSS input file");
    NSInputStream *input = [[NSInputStream alloc] initWithFileAtPath:inputFileName];
    STAssertNotNil(input, @"could not open input stream");
}


- (void)testRSSSampleCreatedCorrectChannelsAndItems {
    
    [self parseRSSSampleWithFile:@"rss2sample.xml" type:@"rss"];
    NSArray *channels = [RGChannel MR_findAll];
    NSUInteger numberOfCreatedChannels = [channels count];
    STAssertTrue(numberOfCreatedChannels == 1, @"expected 1 channel");
    
    NSArray *items = [RGItem MR_findAll];
    NSUInteger numberOfCreatedItems = [items count];
    STAssertTrue(numberOfCreatedItems == 4, @"expected 4 items");
}


- (void)testRSSSample2CreatedCorrectChannelsAndItems {
    
    [self parseRSSSampleWithFile:@"spiegelIndex" type:@"rss"];
    NSArray *channels = [RGChannel MR_findAll];
    NSUInteger numberOfCreatedChannels = [channels count];
    STAssertTrue(numberOfCreatedChannels == 1, @"expected 1 channel");
    
    NSArray *items = [RGItem MR_findAll];
    NSUInteger numberOfCreatedItems = [items count];
    STAssertTrue(numberOfCreatedItems == 30, @"expected 30 items");
}


/////////////////////////////////////////////////////////////////////////////////////////////
# pragma mark - Private Helpers

- (void)parseRSSSampleWithFile:(NSString *)fileName type:(NSString *)type
{
    NSString *inputFile = [[NSBundle mainBundle] pathForResource:fileName ofType:type];
    STAssertNotNil(inputFile, @"could not find RSS/Atom input file");
    NSData *inputData = [NSData dataWithContentsOfFile:inputFile];
    
    NSError *error = nil;
    FPFeed *feed = [FPParser parsedFeedWithData:inputData error:&error];
    if (error) {
        DDLogError(@"%s: error=%@", __FUNCTION__, error.localizedDescription);
    }

    STAssertNotNil(feed, @"feed empty");
    
    [MagicalRecord setupCoreDataStackWithStoreNamed:@"RGRSS.sqlite"];
    //    [MagicalRecord setupCoreDataStackWithAutoMigratingSqliteStoreNamed:@"RGRSS.sqlite"];
    
    __block RGChannel *appFeed = nil;
    [MagicalRecord saveWithBlockAndWait:^(NSManagedObjectContext *localContext) {
        
        NSString *feedTitle = [feed title];
        appFeed = [RGChannel feedWithName:feedTitle inContext:localContext];    // returns feed if exists; if not, creates the feed
        [appFeed MR_importValuesForKeysWithObject:feed];
        
    }];
    
    NSLog(@"done");
}


- (void)wipeAllChannelsAndItems {
    [RGChannel MR_deleteAllMatchingPredicate:[NSPredicate predicateWithValue:YES]];
    [RGItem MR_deleteAllMatchingPredicate:[NSPredicate predicateWithValue:YES]];
}

@end
