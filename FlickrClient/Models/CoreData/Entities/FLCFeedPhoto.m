//
//  FLCFeedPhoto.m
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/24/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import "FLCFeedPhoto.h"
#import "FLCDataTransformer.h"

@implementation FLCFeedPhoto

+ (EKManagedObjectMapping *)objectMapping
{
    EKManagedObjectMapping *mapping = [EKManagedObjectMapping mappingForEntityName:NSStringFromClass([self class])
                                                                         withBlock:^(EKManagedObjectMapping *mapping)
                                       {
                                           [mapping mapKeyPath:@"id" toProperty:@"remoteId"
                                                withValueBlock:^id(NSString *key, id value, NSManagedObjectContext *context)
                                            {
                                                return [FLCDataTransformer integerNumberFromValue:value];
                                            }];
                                           [mapping mapKeyPath:@"title" toProperty:@"title"];
                                           [mapping mapKeyPath:@"url_l" toProperty:@"url"];
                                       }];
    mapping.primaryKey = @"remoteId";
    return mapping;
}

@end
