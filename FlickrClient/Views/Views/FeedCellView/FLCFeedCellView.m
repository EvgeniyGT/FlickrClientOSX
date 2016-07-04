//
//  FLCFeedCellView.m
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 7/1/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import "FLCFeedCellView.h"

@implementation FLCFeedCellView

- (void)awakeFromNib {
    [super awakeFromNib];
    NSTrackingArea *mouseMovedTrackingArea = [[NSTrackingArea alloc] initWithRect:[self bounds] options:NSTrackingMouseEnteredAndExited | NSTrackingActiveAlways owner:self userInfo:nil];
    [self addTrackingArea:mouseMovedTrackingArea];
}

- (void)mouseEntered:(NSEvent *)theEvent
{
    NSLog(@"mouseEntered");
}

- (void)mouseExited:(NSEvent *)theEvent
{
    NSLog(@"EXIT");
}

- (void)updateTrackingAreas
{
    NSArray *trackingAreas = [self.trackingAreas copy];
    for (NSTrackingArea *trackingArea in trackingAreas) {
        [self removeTrackingArea:trackingArea];
        [self addTrackingArea:[[NSTrackingArea alloc] initWithRect:[self bounds] options:trackingArea.options owner:trackingArea.owner userInfo:trackingArea.userInfo]];
    }
    [super updateTrackingAreas];
}

@end
