//
//  CDODetailViewController.m
//  Core Data Objection
//
//  Created by Ahmed Nuaman on 12/02/2014.
//  Copyright (c) 2014 FireStarter Media Limited. All rights reserved.
//

#import "CDODetailViewController.h"

@implementation CDODetailViewController

objection_register(CDODetailViewController)
objection_requires_sel(@selector(cdoModelDelegate))
objection_initializer_sel(@selector(awakeFromNib), @"CDODetailViewController")

@synthesize cdoModelDelegate;

- (void)awakeFromNib {
    [super awakeFromNib];
    [[JSObjection defaultInjector] injectDependencies:self];
}

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        [self configureView];
    }
}

- (void)configureView {
    if (self.detailItem) {
        self.nameField.text = [[self.detailItem valueForKey:@"name"] description];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
}

- (IBAction)save:(id)sender {
    if (self.detailItem) {
        [self.detailItem setValue:_nameField.text forKey:@"name"];
        
        [self.cdoModelDelegate save];
    }
}

@end
