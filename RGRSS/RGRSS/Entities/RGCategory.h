//
//  RGCategory.h
//  RGRSS
//
//  Created by Roland on 01/06/2013.
//  Copyright (c) 2013 RG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class RGChannel, RGItem;

@interface RGCategory : NSManagedObject

@property (nonatomic, retain) NSString * category;
@property (nonatomic, retain) RGChannel *channel;
@property (nonatomic, retain) RGItem *item;

@end
