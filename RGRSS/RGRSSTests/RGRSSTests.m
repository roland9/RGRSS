//
//  RGRSSTests.m
//  RGRSSTests
//
//  Created by Roland on 01/06/2013.
//  Copyright (c) 2013 RG. All rights reserved.
//

#import "RGRSSTests.h"
//#import <BlockRSSParser/RSSParser.h>
#import <FeedParser.h>
#import "FPParser.h"
#import "RGChannel.h"
#import <CoreData+MagicalRecord.h>


@implementation RGRSSTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testReadRSSSample
{
    NSString *inputFileName = [[NSBundle mainBundle] pathForResource:@"rss2sample.xml" ofType:@"rss"];
    STAssertNotNil(inputFileName, @"could not find RSS input file");
    NSInputStream *input = [[NSInputStream alloc] initWithFileAtPath:inputFileName];
    STAssertNotNil(input, @"could not open input stream");
}


- (void)testParseRSSSample
{
    NSString *inputFile = [[NSBundle mainBundle] pathForResource:@"rss2sample.xml" ofType:@"rss"];
    STAssertNotNil(inputFile, @"could not find RSS input file");
//    NSInputStream *inputStream = [[NSInputStream alloc] initWithFileAtPath:inputFile];
    NSData *inputData = [NSData dataWithContentsOfFile:inputFile];
    
    NSError *error = nil;
    FPFeed *feed = [FPParser parsedFeedWithData:inputData error:&error];

    STAssertNotNil(feed, @"feed empty");
    
    [MagicalRecord setupCoreDataStackWithStoreNamed:@"RGRSS.sqlite"];
//    [MagicalRecord setupCoreDataStackWithAutoMigratingSqliteStoreNamed:@"RGRSS.sqlite"];
    
    __block RGChannel *appFeed = nil;
    [MagicalRecord saveWithBlockAndWait:^(NSManagedObjectContext *localContext) {
        
        NSString *feedTitle = [feed title];
        appFeed = [RGChannel feedWithName:feedTitle inContext:localContext];
        [appFeed MR_importValuesForKeysWithObject:feed];
        
    }];

    NSLog(@"done");
    
//    NSURL *inputURL = [[NSBundle mainBundle] URLForResource:@"rss2sample.xml" withExtension:@"rss"];
//    STAssertNotNil(inputURL, @"could not find RSS input file");
//    
//    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
//
//    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://blog.lelevier.fr/rss"]];
//    [RSSParser parseRSSFeedForRequest:req success:^(NSArray *feedItems) {
//        
//        //you get an array of RSSItem
//        STAssertNotNil(feedItems, @"feed items were nil");
//        dispatch_semaphore_signal(sema);
//
//    } failure:^(NSError *error) {
//        
//        //something went wrong
//        STFail(@"failed to parse");
//        dispatch_semaphore_signal(sema);
//    }];
//
//    dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);

}


@end
