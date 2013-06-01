//
//  RGChannel.m
//  RGRSS
//
//  Created by Roland on 01/06/2013.
//  Copyright (c) 2013 RG. All rights reserved.
//

#import "RGChannel.h"
#import "RGCategory.h"
#import "RGItem.h"
#import <CoreData+MagicalRecord.h>


@implementation RGChannel

@dynamic cloud;
@dynamic copyright;
@dynamic docs;
@dynamic generator;
@dynamic language;
@dynamic lastBuildDate;
@dynamic link;
@dynamic managingEditor;
@dynamic pubDate;
@dynamic rssDescription;
@dynamic title;
@dynamic ttl;
@dynamic webMaster;
@dynamic category;
@dynamic item;

+ (id) feedWithName:(NSString *)name inContext:(NSManagedObjectContext *)context
{
    RGChannel *feed = [self MR_findFirstByAttribute:@"link" withValue:name inContext:context];
    if (feed == nil)
    {
        feed = [self MR_createInContext:context];
        feed.link = name;
    }
    return feed;
}

@end
