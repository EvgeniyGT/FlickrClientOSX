//
//  FLCPhotoCollectionViewItem.m
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/30/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import "FLCPhotoCollectionViewItem.h"
#import "FLCFeedPhoto.h"
#import "FLCMouseTrackingView.h"
#import "FLCWobbleAnimator.h"

#import "NSImageView+WebCache.h"
#import "NSColor+HexString.h"
#import "NSImage+Resize.h"

@interface FLCPhotoCollectionViewItem ()
<NSImageViewWebCacheDelegate,
FLCMouseTrackingDelegate>

/* UI */
@property (weak, nonatomic) IBOutlet NSView *contentContainerView;
@property (weak, nonatomic) IBOutlet NSImageView *photoImageView;
@property (weak, nonatomic) IBOutlet NSView *overlayView;
@property (weak, nonatomic) IBOutlet NSImageView *reviewImageView;

/* Animator */
@property (strong, nonatomic) FLCWobbleAnimator *animator;

@end

@implementation FLCPhotoCollectionViewItem

#pragma mark - Accessors

- (FLCWobbleAnimator *)animator
{
    if (!_animator) {
        _animator = [[FLCWobbleAnimator alloc] initWithTargetView:self.contentContainerView];
    }
    return _animator;
}

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

- (void)showReviewIcon:(BOOL)show
{
    self.reviewImageView.hidden = self.overlayView.hidden = !show;
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

#pragma mark - FLCMouseTrackingDelegate

- (void)mouseTracking:(FLCMouseTrackingView *)mouseTracking mouseEntered:(NSEvent *)theEvent
{
    if (self.photoImageView.image) {
        [self.animator startAnimation];
        [self showReviewIcon:YES];
    } else {
        [self.animator stopAnimation];
        [self showReviewIcon:NO];
    }
}

- (void)mouseTracking:(FLCMouseTrackingView *)mouseTracking mouseExited:(NSEvent *)theEvent
{
    [self.animator stopAnimation];
    [self showReviewIcon:NO];
}

@end
