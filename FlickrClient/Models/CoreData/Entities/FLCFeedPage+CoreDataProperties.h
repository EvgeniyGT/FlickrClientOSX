//
//  FLCFeedPage+CoreDataProperties.h
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/24/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "FLCFeedPage.h"

NS_ASSUME_NONNULL_BEGIN

@interface FLCFeedPage (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *page;
@property (nullable, nonatomic, retain) NSNumber *pages;
@property (nullable, nonatomic, retain) NSNumber *perpage;

@end

NS_ASSUME_NONNULL_END
