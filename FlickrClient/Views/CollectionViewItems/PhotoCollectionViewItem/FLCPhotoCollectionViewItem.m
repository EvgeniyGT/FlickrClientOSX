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
#import "NSImage+Resize.h"

@interface FLCPhotoCollectionViewItem () <NSImageViewWebCacheDelegate>

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
    self.photoImageView.webCacheDelegate = self;
    [self.photoImageView setImageURL:url];
}

#pragma mark - copyWithZone

- (instancetype)copyWithZone:(NSZone *)zone
{
    NSString *itemStoryboardIdentifier = NSStringFromClass([FLCPhotoCollectionViewItem class]);
    FLCPhotoCollectionViewItem *item = [self.storyboard instantiateControllerWithIdentifier:itemStoryboardIdentifier];
    return item;
}

#pragma mark - NSImageViewWebCacheDelegate

- (void)imageView:(NSImageView *)imageView downloadImageSuccessed:(NSImage *)image data:(NSData *)data
{
    imageView.image = nil;
    imageView.image = [image resizedToSize:imageView.bounds.size usingScalingMode:ViewScalingModeScaleAspectFill];
}

- (void)imageViewDownloadImageFailed:(NSImageView *)imageView
{
    NSLog(@"image loading failed");
}


@end
