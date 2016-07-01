//
//  FLCTabBarContentViewControllersBuilder.m
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/22/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import "FLCTabBarContentViewControllersBuilder.h"

#import "FLCFeedListViewController.h"
#import "FLCPhotostreamViewController.h"
#import "FLCUploadViewController.h"

#import "FLCStoryboardDefinitions.h"
#import "NSViewController+Storyboard.h"

@interface FLCTabBarContentViewControllersBuilder ()

/* Dependencies */
@property (weak, nonatomic) HCDCoreDataStackController *coreDataController;

@end

@implementation FLCTabBarContentViewControllersBuilder

#pragma mark - Init

- (instancetype)initWitCoreDataController:(HCDCoreDataStackController *)coreDataController
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

- (NSArray *)contentViewControllers
{
    return @[[self feedListViewController],
             [self photostreamViewController],
             [self uploadViewController]];
}

#pragma mark -
#pragma mark - Private
#pragma mark -

/* Feed VC */
- (NSViewController *)feedListViewController
{
    FLCFeedListViewController *feedListViewController = nil;
    feedListViewController = [FLCFeedListViewController controllerFromStoryboardWithName:FLCFeedStoryboardName];
    feedListViewController.coreDataController = self.coreDataController;
    return feedListViewController;
}

/* Photostream VC */
- (NSViewController *)photostreamViewController
{
    FLCPhotostreamViewController *photostreamViewController = nil;
    photostreamViewController = [FLCPhotostreamViewController controllerFromStoryboardWithName:FLCPhotostreamStoryboardName];
    return photostreamViewController;
}

/* Uploads VC */
- (NSViewController *)uploadViewController
{
    FLCUploadViewController *uploadViewController = nil;
    uploadViewController = [FLCUploadViewController controllerFromStoryboardWithName:FLCUploadStoryboardName];
    return uploadViewController;
}

@end
