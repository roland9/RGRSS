//
//  RGFeedManager.h
//  RGRSS
//
//  Created by RolandG on 06/09/2013.
//  Copyright (c) 2013 RG. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RGChannel;


@interface RGFeedManager : NSObject <NSXMLParserDelegate>

@property (nonatomic, readonly, strong) NSArray *responseEntries;
@property (nonatomic, readonly, strong) NSArray *metadataEntries;

- (NSArray *)itemsWithParentId:(NSString *)theParentId;

- (void)reloadAllChannels;
- (void)reloadChannel:(RGChannel *)channel;

- (void)loadDataURL:(NSURL *)theURL;
- (void)loadMetadataURL:(NSURL *)theURL;

- (void)createTestEnvironment;

+ (id)sharedRGFeedManager;

@end
