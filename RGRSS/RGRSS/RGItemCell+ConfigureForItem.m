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
    
    if ([item.numberOfSubentries integerValue] > 0) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.selectionStyle = UITableViewCellSelectionStyleGray;
        self.subentriesLabel.text = item.numberOfSubentries;
    } else {
        self.accessoryType = UITableViewCellAccessoryNone;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.subentriesLabel.text = @"";
    }
}


//- (NSDateFormatter *)dateFormatter
//{
//    static NSDateFormatter *dateFormatter;
//    if (!dateFormatter) {
//        dateFormatter = [[NSDateFormatter alloc] init];
//        dateFormatter.timeStyle = NSDateFormatterMediumStyle;
//        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
//    }
//    return dateFormatter;
//}


@end
