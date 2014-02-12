//
//  CDOAppDelegate.h
//  Core Data Objection
//
//  Created by Ahmed Nuaman on 12/02/2014.
//  Copyright (c) 2014 FireStarter Media Limited. All rights reserved.
//

#import <Objection/Objection.h>
#import <UIKit/UIKit.h>
#import "CDOModelDelegate.h"

@interface CDOAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) CDOModelDelegate *cdoModelDelegate;
@property (strong, nonatomic) UIWindow *window;

@end
