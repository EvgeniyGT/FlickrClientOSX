//
//  FLCMouseTrackingView.m
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 7/4/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import "FLCMouseTrackingView.h"

@implementation FLCMouseTrackingView

#pragma mark - Init

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(NSRect)frameRect
{
    self = [super initWithFrame:frameRect];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    [self createTrackingArea];
}

- (void)createTrackingArea
{
    NSTrackingAreaOptions opts = (NSTrackingMouseEnteredAndExited | NSTrackingActiveAlways);
    NSTrackingArea *trackingArea = [ [NSTrackingArea alloc] initWithRect:[self bounds]
                                                 options:opts
                                                   owner:self
                                                userInfo:nil];
    [self addTrackingArea:trackingArea];
    
    NSPoint mouseLocation = [[self window] mouseLocationOutsideOfEventStream];
    mouseLocation = [self convertPoint: mouseLocation
                              fromView: nil];
    
    if (NSPointInRect(mouseLocation, [self bounds])) {
        [self mouseEntered:[NSEvent new]];
    }
    else {
        [self mouseExited:[NSEvent new]];
    }
}

#pragma mark - NSTrackingArea

- (void)mouseEntered:(NSEvent *)theEvent
{
    if ([self.delegate respondsToSelector:@selector(mouseTracking:mouseEntered:)]) {
        [self.delegate mouseTracking:self mouseEntered:theEvent];
    }
}

- (void)mouseExited:(NSEvent *)theEvent
{
    if ([self.delegate respondsToSelector:@selector(mouseTracking:mouseExited:)]) {
        [self.delegate mouseTracking:self mouseExited:theEvent];
    }
}

- (void)updateTrackingAreas
{
    NSArray *trackingAreas = [self.trackingAreas copy];
    for (NSTrackingArea *trackingArea in trackingAreas) {
        [self removeTrackingArea:trackingArea];
        [self createTrackingArea];
    }
    [super updateTrackingAreas];
}


@end
