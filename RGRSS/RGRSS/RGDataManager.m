//
//  RGDataManager.m
//  RGRSS
//
//  Created by Roland on 08/02/2014.
//  Copyright (c) 2014 RG. All rights reserved.
//

#import "RGDataManager.h"
#import "RGFeedManager.h"
#import "DDLog.h"

#ifdef DEBUG
static const int ddLogLevel = LOG_LEVEL_INFO;
#else
static const int ddLogLevel = LOG_LEVEL_ERROR;
#endif


@interface RGDataManager()


@end


@implementation RGDataManager

/////////////////////////////////////////////////////////////////////////////////////////////
# pragma mark - Public


/////////////////////////////////////////////////////////////////////////////////////////////
# pragma mark - Setter


/////////////////////////////////////////////////////////////////////////////////////////////
# pragma mark - shared instance

- (id)init {
    self = [super init];
    if (self) {
        
        [[RGFeedManager sharedRGFeedManager] loadDataURLString:@"0Apmsn6hlyPHudDBHbWJ6NkI4SFNwTEkzQVBXS3VGY0E/od6/public/values?alt=json"];
        
        [[RGFeedManager sharedRGFeedManager] loadMetadataURLString:@"0Apmsn6hlyPHudDBHbWJ6NkI4SFNwTEkzQVBXS3VGY0E/od7/public/values?alt=json"];
    }
    return self;
}


+ (id)sharedRGDataManager {
    static dispatch_once_t onceQueue;
    static RGDataManager *rGDataManager = nil;
    
    dispatch_once(&onceQueue, ^{ rGDataManager = [[self alloc] init]; });
    return rGDataManager;
}

@end
