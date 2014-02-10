//
//  RGItemCell.h
//  RGRSS
//
//  Created by Roland on 07/02/2014.
//  Copyright (c) 2014 RG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RGItemCell : UITableViewCell

+ (UINib *)nib;

@property (weak, nonatomic) IBOutlet UILabel *itemTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subentriesLabel;
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImageView;

@end
