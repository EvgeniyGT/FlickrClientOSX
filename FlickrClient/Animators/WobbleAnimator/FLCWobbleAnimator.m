//
//  FLCWobbleAnimator.m
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 7/4/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import "FLCWobbleAnimator.h"
#import <QuartzCore/QuartzCore.h>

#define ARC4RANDOM_MAX 0x100000000
static CGFloat const FLCWobbleAnimatorRotationFrameRate = 0.4f;

@interface FLCWobbleAnimator ()

/* View for animation */
@property (weak, nonatomic) NSView *targetView;

/* Settings */
@property (assign, nonatomic) CGFloat rotationDelay;

@end

@implementation FLCWobbleAnimator

#pragma mark - Init

- (instancetype)initWithTargetView:(NSView *)targerView
{
    self = [super init];
    if (self) {
        _targetView = targerView;
        _rotationDelay = CACurrentMediaTime() + ((float)arc4random() / ARC4RANDOM_MAX) * FLCWobbleAnimatorRotationFrameRate;
    }
    return self;
}

#pragma mark -
#pragma mark - Public
#pragma mark -

- (void)startAnimation
{
    self.targetView.wantsLayer = YES;
    
    CGRect frame = self.targetView.layer.frame;
    CGPoint center = CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame));
    self.targetView.layer.anchorPoint = CGPointMake(0.5,0.5);
    self.targetView.layer.position = center;
    
    CAKeyframeAnimation *animation1 = [CAKeyframeAnimation animation];
    animation1.keyPath = @"transform.rotation.z";
    animation1.duration = FLCWobbleAnimatorRotationFrameRate;
    animation1.repeatCount = INFINITY;
    
    NSNumber *frame11 = @(0.015);
    NSNumber *frame12 = @(0.005);
    NSNumber *frame13 = @(-0.03);
    NSNumber *frame14 = @(-0.005);
    
    animation1.values = @[frame11,frame12,frame13,frame14];
    animation1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation1.beginTime = self.rotationDelay;
    [self.targetView.layer addAnimation:animation1 forKey:@"wobble_rotation"];
}

- (void)stopAnimation
{
    [self.targetView.layer removeAnimationForKey:@"wobble_rotation"];
}

@end
