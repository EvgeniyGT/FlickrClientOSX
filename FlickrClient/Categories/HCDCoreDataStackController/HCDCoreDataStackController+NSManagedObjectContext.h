//
//  HCDCoreDataStackController+NSManagedObjectContext.h
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/24/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import <HardCoreData/HCDCoreDataStackController.h>

@interface HCDCoreDataStackController (NSManagedObjectContext)
- (NSManagedObjectContext *)spawnEphemeralBackgroundContext;
@end
