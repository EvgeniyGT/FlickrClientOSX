//
//  FLCPhotoCollectionViewItem.m
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/30/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import "FLCPhotoCollectionViewItem.h"
#import "FLCFeedPhoto.h"
#import "FLCFeedCellView.h"

#import "NSImageView+WebCache.h"
#import "NSColor+HexString.h"

@interface FLCPhotoCollectionViewItem ()

/* UI */
@property (weak, nonatomic) IBOutlet NSImageView *photoImageView;

@end

@implementation FLCPhotoCollectionViewItem

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self reloadPhotoImage];
}

#pragma mark - Update with FLCFeedPhoto

- (void)setRepresentedObject:(FLCFeedPhoto *)feedPhoto
{
    [super setRepresentedObject:feedPhoto];
    if (feedPhoto && [self isViewLoaded]) {
        [self reloadPhotoImage];
    }
}

#pragma mark - Reload 

- (void)reloadPhotoImage
{
    FLCFeedPhoto *feedPhoto = self.representedObject;
    NSURL *url = [NSURL URLWithString:feedPhoto.url];
    [self.photoImageView setImageURL:url];
}

#pragma mark - Copy

- (instancetype)copyWithZone:(NSZone *)zone
{
    NSString *itemStoryboardIdentifier = NSStringFromClass([FLCPhotoCollectionViewItem class]);
    FLCPhotoCollectionViewItem *item = [self.storyboard instantiateControllerWithIdentifier:itemStoryboardIdentifier];
    return item;
}

@end
