//
//  RGItemsTVC.h
//  RGRSS
//
//  Created by Roland on 16/06/2013.
//  Copyright (c) 2013 RG. All rights reserved.
//

#import "RGBaseTVC.h"

@class RGDetailViewController, RGChannel;


@interface RGItemsTVC : RGBaseTVC <RGBaseFRCProtocol>

@property (strong, nonatomic) RGChannel *channel;
@property (strong, nonatomic) RGDetailViewController *detailViewController;

@end
