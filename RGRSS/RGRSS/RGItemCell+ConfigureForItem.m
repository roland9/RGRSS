//
//  RGItemCell+ConfigureForItem.m
//  RGRSS
//
//  Created by Roland on 07/02/2014.
//  Copyright (c) 2014 RG. All rights reserved.
//

#import "RGItemCell+ConfigureForItem.h"
#import "RGObject.h"


@class RGObject;


@implementation RGItemCell (ConfigureForItem)

- (void)configureForItem:(RGObject *)item
{
    self.itemTitleLabel.text = item.itemDescription;
//    self.itemDateLabel.text = [self.dateFormatter stringFromDate:item.creationDate];
}

- (NSDateFormatter *)dateFormatter
{
    static NSDateFormatter *dateFormatter;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.timeStyle = NSDateFormatterMediumStyle;
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    }
    return dateFormatter;
}


@end
