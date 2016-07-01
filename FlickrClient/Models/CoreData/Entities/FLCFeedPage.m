//
//  FLCFeedPage.m
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/24/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import "FLCFeedPage.h"
#import "FLCDataTransformer.h"

@implementation FLCFeedPage

+ (EKManagedObjectMapping *)objectMapping
{
    EKManagedObjectMapping *mapping = [EKManagedObjectMapping mappingForEntityName:NSStringFromClass([self class])
                                                                         withBlock:^(EKManagedObjectMapping *mapping)
                                       {
                                           [mapping mapKeyPath:@"page" toProperty:@"page"
                                                withValueBlock:^id(NSString *key, id value, NSManagedObjectContext *context)
                                            {
                                                return [FLCDataTransformer integerNumberFromValue:value];
                                            }];
                                           [mapping mapKeyPath:@"pages" toProperty:@"pages"
                                                withValueBlock:^id(NSString *key, id value, NSManagedObjectContext *context)
                                            {
                                                return [FLCDataTransformer integerNumberFromValue:value];
                                            }];
                                           [mapping mapKeyPath:@"perpage" toProperty:@"perpage"
                                                withValueBlock:^id(NSString *key, id value, NSManagedObjectContext *context)
                                            {
                                                return [FLCDataTransformer integerNumberFromValue:value];
                                            }];
                                           
                                       }];
    return mapping;
}

@end
