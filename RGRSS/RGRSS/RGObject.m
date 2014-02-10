//
//  RGObject.m
//  RGRSS
//
//  Created by Roland on 07/02/2014.
//  Copyright (c) 2014 RG. All rights reserved.
//

#import "RGObject.h"

@implementation RGObject

// isEqual: is required for the predicate search

- (BOOL)isEqual:(RGObject *)object {
    return
    [object.itemId isEqualToString:self.itemId]  &&
    [object.parentId isEqualToString:self.parentId] &&
    [object.itemDescription isEqualToString:self.itemDescription] &&
    [object.nextLevel isEqualToString:self.nextLevel] &&
    [object.imageFull isEqualToString:self.imageFull] &&
    [object.imageThumbnail isEqualToString:self.imageThumbnail] &&
    [object.detailHTML isEqualToString:self.detailHTML];
    // &&     [object.numberOfSubentries isEqualToNumber:self.numberOfSubentries];
}

@end
