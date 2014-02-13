//
//  CDOAppDelegate.m
//  Core Data Objection
//
//  Created by Ahmed Nuaman on 12/02/2014.
//  Copyright (c) 2014 FireStarter Media Limited. All rights reserved.
//

#import "CDOAppDelegate.h"

@implementation CDOAppDelegate

objection_register(CDOAppDelegate)
objection_requires_sel(@selector(cdoModelDelegate))

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    JSObjectionInjector *injector = [JSObjection createInjector];
    [JSObjection setDefaultInjector:injector];
    [injector injectDependencies:self];

    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [self.cdoModelDelegate save];
}

@end
