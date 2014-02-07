//
//  RGItemCell.m
//  RGRSS
//
//  Created by Roland on 07/02/2014.
//  Copyright (c) 2014 RG. All rights reserved.
//

#import "RGItemCell.h"

@implementation RGItemCell

+ (UINib *)nib
{
    return [UINib nibWithNibName:@"RGItemCell" bundle:nil];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
    if (highlighted) {
        self.itemTitleLabel.shadowColor = [UIColor darkGrayColor];
        self.itemTitleLabel.shadowOffset = CGSizeMake(3, 3);
    } else {
        self.itemTitleLabel.shadowColor = nil;
    }
}

@end
