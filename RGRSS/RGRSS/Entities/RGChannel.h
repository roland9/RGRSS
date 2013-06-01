//
//  RGChannel.h
//  RGRSS
//
//  Created by Roland on 01/06/2013.
//  Copyright (c) 2013 RG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class RGCategory, RGItem;

@interface RGChannel : NSManagedObject

@property (nonatomic, retain) NSString * cloud;
@property (nonatomic, retain) NSString * copyright;
@property (nonatomic, retain) NSString * docs;
@property (nonatomic, retain) NSString * generator;
@property (nonatomic, retain) NSString * language;
@property (nonatomic, retain) NSDate * lastBuildDate;
@property (nonatomic, retain) NSString * link;
@property (nonatomic, retain) NSString * managingEditor;
@property (nonatomic, retain) NSDate * pubDate;
@property (nonatomic, retain) NSString * rssDescription;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSNumber * ttl;
@property (nonatomic, retain) NSString * webMaster;
@property (nonatomic, retain) RGCategory *category;
@property (nonatomic, retain) RGItem *item;


+ (id) feedWithName:(NSString *)name inContext:(NSManagedObjectContext *)context;

@end
