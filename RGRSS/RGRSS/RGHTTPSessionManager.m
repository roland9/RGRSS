//
//  RGHTTPSessionManager.m
//  RGRSS
//
//  Created by Roland on 10/02/2014.
//  Copyright (c) 2014 RG. All rights reserved.
//

#import "RGHTTPSessionManager.h"

@implementation RGHTTPSessionManager

- (NSURL *)baseURL {
    return [NSURL URLWithString:@"http://spreadsheets.google.com/feeds/list/"];
}

@end
