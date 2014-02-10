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

@property (nonatomic, readonly, strong) NSArray *dataEntries;
@property (nonatomic, readonly, strong) NSArray *configDataEntries;

- (NSArray *)itemsWithParentId:(NSString *)theParentId;

- (void)reloadAllChannels;
- (void)reloadChannel:(RGChannel *)channel;

- (void)loadDataURLString:(NSString *)theURLString;
- (void)loadConfigDataURLString:(NSString *)theURLString;

- (void)createTestEnvironment;

+ (id)sharedRGFeedManager;

@end
