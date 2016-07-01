//
//  FLCFeedMapper.m
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/23/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import "FLCFeedMapper.h"
#import "FLCFeedPage.h"
#import "FLCFeedPhoto.h"

#import "NSManagedObject+Convenience.h"
#import "HCDCoreDataStackController+NSManagedObjectContext.h"

static NSString * const FLCFeedMapperResponsePhotosKey  = @"photos";
static NSString * const FLCFeedMapperResponsePhotoKey   = @"photo";

@interface FLCFeedMapper ()

/* Mapper CD Controller */
@property (strong, nonatomic) HCDCoreDataStackController *coreDataController;

@end

@implementation FLCFeedMapper

#pragma mark - Init

- (instancetype)initWithCoreDataController:(HCDCoreDataStackController *)coreDataController
{
    self = [super init];
    if (self) {
        _coreDataController = coreDataController;
    }
    return self;
}

#pragma mark -
#pragma mark - Public
#pragma mark - 

- (void)mapFeedResponse:(NSDictionary *)feedResponse
      erasePreviousData:(BOOL)erasePreviousData
            resultBlock:(FLCFeedMapperResultBlock)resultBlock
{
    NSDictionary *photos = feedResponse[FLCFeedMapperResponsePhotosKey];
    NSArray *photo = photos[FLCFeedMapperResponsePhotoKey];
    
    NSManagedObjectContext *context = [self.coreDataController spawnEphemeralBackgroundContext];
    
    [context performBlock:^{
        if (erasePreviousData) {
            
            /* Remove previous page info */
            [FLCFeedPage truncateAllInContext:context];
            [EKManagedObjectMapper objectFromExternalRepresentation:photos
                                                        withMapping:[FLCFeedPage objectMapping]
                                             inManagedObjectContext:context];
            
            /* Remove previous FeedPhoto entities and save new data  */
            [EKManagedObjectMapper
             syncArrayOfObjectsFromExternalRepresentation:photo
             withMapping:[FLCFeedPhoto objectMapping]
             fetchRequest:[NSFetchRequest fetchRequestWithEntityName:NSStringFromClass([FLCFeedPhoto class])]
             inManagedObjectContext:context];
        }
        
        /* Call resultBlock wirh error */
        void(^doneBlock)(NSError *) = ^(NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                safe_block(resultBlock, error);
            });
        };

        /* Save context */
        if ([context hasChanges]) {
            NSError *error = nil;
            if ([context save:&error]) {
                [self.coreDataController save];
                doneBlock(nil);
            } else {
                doneBlock(error);
                NSLog(@"Save error - %@", error);
            }
        } else {
            doneBlock(nil);
        }
    }];
}

@end
