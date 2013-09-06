//
//  RGFeedManager.h
//  RGRSS
//
//  Created by RolandG on 06/09/2013.
//  Copyright (c) 2013 RG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RGFeedManager : NSObject <NSXMLParserDelegate>

- (void)reloadAllChannels;

+ (id)sharedRGFeedManager;

@end
