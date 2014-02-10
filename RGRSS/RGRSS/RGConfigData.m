//
//  RGConfigData.m
//  RGRSS
//
//  Created by Roland on 07/02/2014.
//  Copyright (c) 2014 RG. All rights reserved.
//

#import "RGConfigData.h"

@implementation RGConfigData

- (BOOL)isEqual:(RGConfigData *)object {
    return [object.configItem isEqualToString:self.configItem]  &&
    [object.configValue isEqualToString:self.configValue];
}

@end
