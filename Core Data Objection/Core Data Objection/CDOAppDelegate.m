//
//  CDOAppDelegate.m
//  Core Data Objection
//
//  Created by Ahmed Nuaman on 12/02/2014.
//  Copyright (c) 2014 FireStarter Media Limited. All rights reserved.
//

#import "CDOAppDelegate.h"

@implementation CDOAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    JSObjectionInjector *injector = [JSObjection createInjector];
    [JSObjection setDefaultInjector:injector];
    
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
    [self.cdoModelDelegate save];
}

- (CDOModelDelegate *)cdoModelDelegate {
    if (!_cdoModelDelegate) {
        _cdoModelDelegate = [[JSObjection defaultInjector] getObject:[CDOModelDelegate class]];
    }
    
    return _cdoModelDelegate;
}

@end
