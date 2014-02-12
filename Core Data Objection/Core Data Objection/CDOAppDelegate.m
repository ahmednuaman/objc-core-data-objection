//
//  CDOAppDelegate.m
//  Core Data Objection
//
//  Created by Ahmed Nuaman on 12/02/2014.
//  Copyright (c) 2014 FireStarter Media Limited. All rights reserved.
//

#import "CDOAppDelegate.h"

@implementation CDOAppDelegate

@synthesize cdoModelDelegate;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    JSObjectionInjector *injector = [JSObjection createInjector];
    [JSObjection setDefaultInjector:injector];
    
    cdoModelDelegate = [[JSObjection defaultInjector] getObject:[CDOModelDelegate class]];
    
    UINavigationController *navigationController = (UINavigationController *)self.window.rootViewController;
    CDOMasterViewController *controller = (CDOMasterViewController *)navigationController.topViewController;
    controller.managedObjectContext = self.cdoModelDelegate.managedObjectContext;
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
    [self.cdoModelDelegate save];
}

@end
