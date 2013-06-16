//
//  RGBaseTVC.h
//  RGRSS
//
//  Created by RolandG on 16/06/2013.
//  Copyright (c) 2013 mapps.ie. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RGBaseFRCProtocol

- (NSArray *)sortDescriptors;
- (NSString *)entityName;
- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;

@optional
- (NSPredicate *)predicate;
- (NSString *)mySectionNameKeyPath;

@end


@interface RGBaseTVC : UITableViewController <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end
