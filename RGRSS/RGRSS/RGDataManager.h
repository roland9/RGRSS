//
//  RGDataManager.h
//  RGRSS
//
//  Created by Roland on 08/02/2014.
//  Copyright (c) 2014 RG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RGDataManager : NSObject

@property (nonatomic, readonly, getter = currentLevel) NSUInteger currentLevel;
@property (nonatomic, copy) NSString *selectedParentId;
- (NSUInteger)increasedLevel;

+ (id)sharedRGDataManager;

@end
