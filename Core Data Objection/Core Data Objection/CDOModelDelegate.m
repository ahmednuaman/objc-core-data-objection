//
//  CDOModelDelegate.m
//  Core Data Objection
//
//  Created by Ahmed Nuaman on 12/02/2014.
//  Copyright (c) 2014 FireStarter Media Limited. All rights reserved.
//

#import "CDOModelDelegate.h"

@implementation CDOModelDelegate

objection_register(CDOModelDelegate)

- (void)awakeFromObjection {
    [self managedObjectContext];
}

- (NSManagedObjectContext *)managedObjectContext {
    if (!managedObjectContext) {
        managedObjectContext = [NSManagedObjectContext new];
        [self.managedObjectContext setPersistentStoreCoordinator:self.persistentStoreCoordinator];
    }
    
    return managedObjectContext;
}

- (NSManagedObjectModel *)managedObjectModel {
    if (!managedObjectModel) {
        managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    }
    
    return managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    if (!persistentStoreCoordinator) {
        persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[NSManagedObjectModel mergedModelFromBundles:nil]];
        NSError *error = nil;
        NSPersistentStore *persistentStore = [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                                                      configuration:nil
                                                                                                URL:self.storeURL
                                                                                            options:nil
                                                                                              error:&error];
        
        NSAssert(!error, ([NSString stringWithFormat:@"Error creating persistentStore: %@\n%@", persistentStore, error]));
    }
    
    return persistentStoreCoordinator;
}

- (NSURL *)storeURL {
    if (!storeURL) {
        storeURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Model"
                                                                          ofType:@"momd"]];
    }
    
    return storeURL;
}

- (NSError *)save {
    NSError *error;
    
    if ([self.managedObjectContext hasChanges]) {
        [self.managedObjectContext save:&error];
        NSAssert(!error, ([NSString stringWithFormat:@"Error saving app managedObjectContext: %@", error]));
    }
    
    return error;
}

@end
