//
//  RGMetadata.m
//  RGRSS
//
//  Created by Roland on 07/02/2014.
//  Copyright (c) 2014 RG. All rights reserved.
//

#import "RGMetadata.h"

@implementation RGMetadata

- (BOOL)isEqual:(RGMetadata *)object {
    return [object.level isEqualToString:self.level]  &&
    [object.myDescription isEqualToString:self.myDescription];
}

@end
