//
//  FLCPhotoCollectionViewItem.m
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/30/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import "FLCPhotoCollectionViewItem.h"
#import "FLCFeedPhoto.h"

#import "NSImageView+WebCache.h"

@interface FLCPhotoCollectionViewItem ()

/* UI */
@property (weak, nonatomic) IBOutlet NSImageView *photoImageView;

@end

@implementation FLCPhotoCollectionViewItem

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"self.photoImageView - %@", self.photoImageView);
    [self setupAppearance];
    [self reloadPhotoImage];
}

#pragma mark - Appearance

- (void)setupAppearance
{
    self.view.wantsLayer = YES;
    self.view.layer.backgroundColor = [NSColor orangeColor].CGColor;
}

#pragma mark - Update with FLCFeedPhoto

- (void)setRepresentedObject:(FLCFeedPhoto *)feedPhoto
{
    [super setRepresentedObject:feedPhoto];
    if (feedPhoto && [self isViewLoaded]) {
        NSLog(@"self.photoImageView  - %@", self.photoImageView);
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

@end
