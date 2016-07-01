//
//  HCDCoreDataStackController+NSManagedObjectContext.m
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/24/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import "HCDCoreDataStackController+NSManagedObjectContext.h"

@implementation HCDCoreDataStackController (NSManagedObjectContext)

- (NSManagedObjectContext *)spawnEphemeralBackgroundContext
{
    NSManagedObjectContext *context = [self createChildContextWithType:NSPrivateQueueConcurrencyType];
    return context;
}

@end
