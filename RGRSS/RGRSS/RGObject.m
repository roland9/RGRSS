//
//  RGObject.m
//  RGRSS
//
//  Created by Roland on 07/02/2014.
//  Copyright (c) 2014 RG. All rights reserved.
//

#import "RGObject.h"

@implementation RGObject

- (BOOL)isEqual:(RGObject *)object {
    return [object.itemId isEqualToString:self.itemId]  &&
    [object.parentId isEqualToString:self.parentId] &&
    [object.itemDescription isEqualToString:self.itemDescription];
}

@end
