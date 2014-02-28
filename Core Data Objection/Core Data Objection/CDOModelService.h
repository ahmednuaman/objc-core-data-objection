//
//  CDOModelService.h
//  Core Data Objection
//
//  Created by Ahmed Nuaman on 17/02/2014.
//  Copyright (c) 2014 FireStarter Media Limited. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Objection/Objection.h>
#import "CDOModelDelegate.h"

@interface CDOModelService : NSObject

@property (strong, nonatomic) CDOModelDelegate *cdoModelDelegate;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

@end
