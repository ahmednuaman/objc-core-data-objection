//
//  CDOMasterViewController.h
//  Core Data Objection
//
//  Created by Ahmed Nuaman on 12/02/2014.
//  Copyright (c) 2014 FireStarter Media Limited. All rights reserved.
//

#import <CoreData/CoreData.h>
#import <Objection/Objection.h>
#import <UIKit/UIKit.h>
#import "CDODetailViewController.h"
#import "CDOModelDelegate.h"

@interface CDOMasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) CDOModelDelegate *cdoModelDelegate;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;

@end
