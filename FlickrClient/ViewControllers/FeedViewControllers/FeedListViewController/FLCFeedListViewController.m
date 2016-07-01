//
//  FLCFeedListViewController.m
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/22/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import "FLCFeedListViewController.h"
#import "FLCFeedMapper.h"
#import "FLCFeedLoader.h"
#import "FLCPhotoCollectionViewItem.h"

@interface FLCFeedListViewController () <NSCollectionViewDelegate>

/* Feed Sync */
@property (strong, nonatomic) FLCFeedLoader *loader;
@property (strong, nonatomic) FLCFeedMapper *mapper;

/* UI */
@property (weak, nonatomic) IBOutlet NSCollectionView *collectionView;

@end

@implementation FLCFeedListViewController

#pragma mark - Lazy Accessors

- (FLCFeedMapper *)mapper
{
    if (!_mapper) {
        _mapper = [[FLCFeedMapper alloc] initWithCoreDataController:self.coreDataController];
    }
    return _mapper;
}

- (FLCFeedLoader *)loader
{
    if (!_loader) {
        _loader = [FLCFeedLoader loaderWithMapper:self.mapper];
    }
    return _loader;
}

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupCollectionView];
    [self syncFeed];
}

#pragma mark - Setup

- (void)setupCollectionView
{
    NSString *itemStoryboardIdentifier = NSStringFromClass([FLCPhotoCollectionViewItem class]);
    NSCollectionViewItem *item = [self.storyboard instantiateControllerWithIdentifier:itemStoryboardIdentifier];
    self.collectionView.itemPrototype = item;
    self.collectionView.wantsLayer = YES;
    self.collectionView.layer.backgroundColor = [NSColor yellowColor].CGColor;
}

#pragma mark - Data Management

- (void)syncFeed
{
    [self.loader syncFeedWithResultBlock:^(BOOL success, NSError *error) {
        NSLog(@"sync completed - %d", success);
    }];
}

@end
