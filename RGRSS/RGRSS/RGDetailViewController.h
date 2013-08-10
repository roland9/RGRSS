//
//  RGDetailViewController.h
//  RGRSS
//
//  Created by Roland on 01/06/2013.
//  Copyright (c) 2013 RG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RGDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (strong, nonatomic) id detailItem;

@end
