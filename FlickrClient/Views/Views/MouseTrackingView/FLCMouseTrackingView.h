//
//  FLCMouseTrackingView.h
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 7/4/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@protocol FLCMouseTrackingDelegate;

@interface FLCMouseTrackingView : NSView

/**
 *  Mouse changes delegate
 */
@property (weak, nonatomic) IBOutlet id <FLCMouseTrackingDelegate> delegate;

@end

@protocol FLCMouseTrackingDelegate <NSObject>
@optional
- (void)mouseTracking:(FLCMouseTrackingView *)mouseTracking mouseEntered:(NSEvent *)theEvent;
- (void)mouseTracking:(FLCMouseTrackingView *)mouseTracking mouseExited:(NSEvent *)theEvent;
@end