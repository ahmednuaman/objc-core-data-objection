//
//  CDODetailViewController.h
//  Core Data Objection
//
//  Created by Ahmed Nuaman on 12/02/2014.
//  Copyright (c) 2014 FireStarter Media Limited. All rights reserved.
//

#import <Objection/Objection.h>
#import <UIKit/UIKit.h>
#import "CDOModelDelegate.h"

@interface CDODetailViewController : UIViewController

@property (strong, nonatomic) CDOModelDelegate *cdoModelDelegate;
@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

- (void)configureView;

@end
