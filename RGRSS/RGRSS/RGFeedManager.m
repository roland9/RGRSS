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
#import "RGHTTPSessionManager.h"
#import "FPFeed.h"
#import "FPParser.h"
#import "RGObject.h"
#import "RGConfigData.h"
#import "DDLog.h"

#ifdef DEBUG
static const int ddLogLevel = LOG_LEVEL_INFO;
#else
static const int ddLogLevel = LOG_LEVEL_ERROR;
#endif


@interface RGFeedManager()
@end


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

- (NSArray *)itemsWithParentId:(NSString *)theParentId {
    DDLogInfo(@"%s: parentId=%@", __FUNCTION__, theParentId);

    return [self.responseEntries filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"parentId = %@", theParentId]];
}


- (void)reloadChannel:(RGChannel *)channel {
    DDLogInfo(@"%s", __FUNCTION__);

#warning fix the hard coded URLs
//    [[AFHTTPClient clientWithBaseURL:[NSURL URLWithString:@"http://www.spiegel.de/"]] getPath:@"schlagzeilen/tops/index.rss" parameters:NULL success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSError *error;
//        FPFeed *feed = [FPParser parsedFeedWithData:responseObject error:&error];
//
//        __block RGChannel *appFeed = nil;
//        [MagicalRecord saveWithBlockAndWait:^(NSManagedObjectContext *localContext) {
//            
//            NSString *feedTitle = [feed title];
//            appFeed = [RGChannel feedWithName:feedTitle inContext:localContext];
//            [appFeed MR_importValuesForKeysWithObject:feed];
//            
//        }];
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
////        <#code#>
//    }];
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


- (void)loadDataURLString:(NSString *)theURLString {
    DDLogInfo(@"%s: url=%@", __FUNCTION__, theURLString);

    [[RGHTTPSessionManager manager] GET:theURLString parameters:NULL success:^(NSURLSessionDataTask *task, id responseObject) {
        NSError *error;
        
        if (!error) {
            NSAssert([responseObject isKindOfClass:[NSDictionary class]], @"inconsistent");
            NSDictionary *json = (NSDictionary *)responseObject;

            NSArray *entries = json[@"feed"][@"entry"];
            NSAssert([entries isKindOfClass:[NSArray class]], @"expected array");
            NSMutableArray __block *itemEntries = [NSMutableArray array];
            
            [entries enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL *stop) {
                NSAssert([dict isKindOfClass:[NSDictionary class]], @"inconsistent");
                
                RGObject *item = [[RGObject alloc] init];
                item.itemId = dict[@"gsx$itemid"][@"$t"];
                item.parentId = dict[@"gsx$parentid"][@"$t"];
                item.itemDescription = dict[@"gsx$itemdescription"][@"$t"];
                item.nextLevel = dict[@"gsx$nextlevel"][@"$t"];
                item.imageFull = dict[@"gsx$imagefull"][@"$t"];
                item.imageThumbnail = dict[@"gsx$imagethumbnail"][@"$t"];
                item.detailHTML = dict[@"gsx$detailhtml"][@"$t"];
                
                [itemEntries addObject:item];
            }];
            
            [self updateSubentries:itemEntries];
            DDLogVerbose(@"%s: itemEntries=%@", __FUNCTION__, itemEntries);
            
            self.responseEntries = [NSArray arrayWithArray:itemEntries];
            
        } else
            self.responseEntries = nil;
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        self.responseEntries = nil;
        
    }];

//    [[AFHTTPClient clientWithBaseURL:theURL] getPath:@"" parameters:NULL success:^(AFHTTPRequestOperation *operation, id responseObject) {
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//
//    }];
}


- (void)loadMetadataURLString:(NSString *)theURLString {
    DDLogInfo(@"%s: url=%@", __FUNCTION__, theURLString);
    
    [[RGHTTPSessionManager manager] GET:theURLString parameters:NULL success:^(NSURLSessionDataTask *task, id responseObject) {
        NSError *error;
        
        if (!error) {
            NSAssert([responseObject isKindOfClass:[NSDictionary class]], @"inconsistent");
            NSDictionary *json = (NSDictionary *)responseObject;

            NSArray *entries = json[@"feed"][@"entry"];
            NSAssert([entries isKindOfClass:[NSArray class]], @"expected array");
            NSMutableArray __block *configEntries = [NSMutableArray array];
            
            [entries enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL *stop) {
                NSAssert([dict isKindOfClass:[NSDictionary class]], @"inconsistent");
                
                RGConfigData *config = [[RGConfigData alloc] init];
                config.configItem = dict[@"gsx$settings"][@"$t"];
                config.configValue = dict[@"gsx$value"][@"$t"];
                
                [configEntries addObject:config];
            }];
            
            DDLogVerbose(@"%s: itemEntries=%@", __FUNCTION__, configEntries);
            
            self.metadataEntries = [NSArray arrayWithArray:configEntries];
            
        } else
            self.metadataEntries = nil;
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        self.metadataEntries = nil;
        
    }];
}

- (void)createTestEnvironment {
    DDLogInfo(@"%s", __FUNCTION__);

    [self initDataSample:@"rss2sample.xml" type:@"rss"];
    [self initDataSample:@"spiegelIndex" type:@"rss"];
}


/////////////////////////////////////////////////////////////////////////////////////////////
# pragma mark - Private

- (void)updateSubentries:(NSMutableArray *)entries {

    [entries enumerateObjectsUsingBlock:^(RGObject *obj, NSUInteger idx, BOOL *stop) {
#warning optimize - check if been calculated before
        obj.numberOfSubentries = @([[entries filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"parentId = %@", obj.itemId]] count]);
    }];
}


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
}


//- (void)createDummyChannel {
//    RGChannel *newChannel = [RGChannel MR_createInContext:[NSManagedObjectContext MR_contextForCurrentThread]];
//
//    newChannel.feedDescription = @"dummy channel";
//    newChannel.language = @"English (IE)";
//    newChannel.lastBuildDate = [NSDate date];
//    newChannel.link = @"http://www.spiegel.de/schlagzeilen/tops/index.rss";
//    newChannel.pubDate = [NSDate date];
//    newChannel.title = @"My Dummy Channel";
//
//    [[NSManagedObjectContext MR_contextForCurrentThread] MR_saveToPersistentStoreAndWait];
//}


/////////////////////////////////////////////////////////////////////////////////////////////
# pragma mark - Setter

- (void)setResponseEntries:(NSArray *)responseEntries {
    _responseEntries = responseEntries;
}

- (void)setMetadataEntries:(NSArray *)metadataEntries {
    _metadataEntries = metadataEntries;
}


+ (id)sharedRGFeedManager
{
    static dispatch_once_t onceQueue;
    static RGFeedManager *rGFeedManager = nil;
    
    dispatch_once(&onceQueue, ^{ rGFeedManager = [[self alloc] init]; });
    return rGFeedManager;
}

@end
