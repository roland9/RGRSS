//
//  RGObject.h
//  RGRSS
//
//  Created by Roland on 07/02/2014.
//  Copyright (c) 2014 RG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RGObject : NSObject

@property (nonatomic, copy) NSString *itemId;
@property (nonatomic, copy) NSString *parentId;
@property (nonatomic, copy) NSString *itemDescription;
@property (nonatomic, copy) NSString *nextLevel;
@property (nonatomic, copy) NSString *imageFull;
@property (nonatomic, copy) NSString *imageThumbnail;
@property (nonatomic, copy) NSString *detailHTML;

@property (nonatomic, copy) NSNumber *numberOfSubentries;

@end
