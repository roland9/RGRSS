//
//  RGFeedManager.m
//  RGRSS
//
//  Created by RolandG on 06/09/2013.
//  Copyright (c) 2013 RG. All rights reserved.
//

#import "RGFeedManager.h"
#import "RGChannel.h"
#import <AFNetworking/AFNetworking.h>
#import "FPFeed.h"
#import "FPParser.h"
#import "DDLog.h"

#ifdef DEBUG
static const int ddLogLevel = LOG_LEVEL_INFO;
#else
static const int ddLogLevel = LOG_LEVEL_ERROR;
#endif


@implementation RGFeedManager

////////////////////////////////////////////////////////////////////
# pragma mark - NSXMLParserDelegate

- (void)parserDidStartDocument:(NSXMLParser *)parser {
    DDLogInfo(@"%s", __FUNCTION__);

}


- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    DDLogInfo(@"%s: elementName=%@", __FUNCTION__, elementName);

}

////////////////////////////////////////////////////////////////////
# pragma mark - Public

- (void)reloadChannel:(RGChannel *)channel {
    DDLogInfo(@"%s", __FUNCTION__);

#warning fix the hard coded URLs
    [[AFHTTPClient clientWithBaseURL:[NSURL URLWithString:@"http://www.spiegel.de/"]] getPath:@"schlagzeilen/tops/index.rss" parameters:NULL success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError *error;
        FPFeed *feed = [FPParser parsedFeedWithData:responseObject error:&error];

        __block RGChannel *appFeed = nil;
        [MagicalRecord saveWithBlockAndWait:^(NSManagedObjectContext *localContext) {
            
            NSString *feedTitle = [feed title];
            appFeed = [RGChannel feedWithName:feedTitle inContext:localContext];
            [appFeed MR_importValuesForKeysWithObject:feed];
            
        }];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        <#code#>
    }];
}


- (void)reloadAllChannels {
    DDLogInfo(@"%s", __FUNCTION__);

    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"lastBuildDate < %@", [[NSDate date] dateByAddingTimeInterval:-100]];
    
    NSArray *allChannels = [RGChannel MR_findAllWithPredicate:predicate];
    [allChannels enumerateObjectsUsingBlock:^(RGChannel *channel, NSUInteger idx, BOOL *stop) {
        NSAssert([channel isKindOfClass:[RGChannel class]], @"wrong class");
        DDLogInfo(@"%s: channel.link=%@  channel.title=%@", __FUNCTION__, channel.link, channel.title);

        [self reloadChannel:channel];
    }];
}


+ (id)sharedRGFeedManager
{
    static dispatch_once_t onceQueue;
    static RGFeedManager *rGFeedManager = nil;
    
    dispatch_once(&onceQueue, ^{ rGFeedManager = [[self alloc] init]; });
    return rGFeedManager;
}

@end
