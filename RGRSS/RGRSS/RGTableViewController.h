//
//  RGTableViewController.h
//  RGRSS
//
//  Created by Roland on 07/02/2014.
//  Copyright (c) 2014 RG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RGTableViewController : UITableViewController

@property (nonatomic, assign) NSUInteger level;
@property (nonatomic, copy)   NSString   *parentId;

@end
