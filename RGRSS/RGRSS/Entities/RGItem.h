//
//  RGItem.h
//  RGRSS
//
//  Created by Roland on 01/06/2013.
//  Copyright (c) 2013 RG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class RGCategory, RGChannel;

@interface RGItem : NSManagedObject

@property (nonatomic, retain) NSString * author;
@property (nonatomic, retain) NSString * comments;
@property (nonatomic, retain) NSString * enclosure;
@property (nonatomic, retain) NSString * guid;
@property (nonatomic, retain) NSString * itemDescription;
@property (nonatomic, retain) NSString * link;
@property (nonatomic, retain) NSDate * pubDate;
@property (nonatomic, retain) NSString * source;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) RGCategory *category;
@property (nonatomic, retain) RGChannel *channel;

@end
