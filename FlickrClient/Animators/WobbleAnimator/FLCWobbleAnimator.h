//
//  FLCWobbleAnimator.h
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 7/4/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface FLCWobbleAnimator : NSObject

/**
 *  Designated initializer
 *
 *  @param targerView : view for animation
 *
 *  @return FLCWobbleAnimator instance
 */
- (instancetype)initWithTargetView:(NSView *)targerView;

/**
 *  Start wobble animation
 */
- (void)startAnimation;

/**
 *  Stop wobble animation
 */
- (void)stopAnimation;

@end
