//
//  FLCTabBarAnimator.m
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/10/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import "FLCTabBarAnimator.h"
#import "CABasicAnimation+FadeInOut.h"
#import <QuartzCore/QuartzCore.h>

static CGFloat const FLCTabBarAnimatorDuration = 0.15f;

@interface FLCTabBarAnimator ()

/* Animation finish block */
@property (copy, nonatomic) FLCTabBarAnimatorCompletionBlock completionBlock;

@end

@implementation FLCTabBarAnimator

#pragma mark -
#pragma mark - Public
#pragma mark -

- (void)animateFromViewController:(NSViewController *)fromViewController
                 toViewController:(NSViewController *)toViewController
                        direction:(FLCTabBarAnimationDirection)direction
                     inBoundaries:(CGRect)boundaries
                  completionBlock:(FLCTabBarAnimatorCompletionBlock)completionBlock
{
    self.completionBlock = completionBlock;
    
    CALayer *fromLayer = fromViewController.view.layer;
    CALayer *toLayer = toViewController.view.layer;
    
    CGFloat directionCoefficient = direction == FLCTabBarAnimationFromDownToUp ? -1.0f : 1.0f;
    toLayer.position = CGPointMake(0.0f, boundaries.size.height * directionCoefficient);
    
    /* From */
    CABasicAnimation *toLayerPositionAnimation = [self animation];
    toLayerPositionAnimation.toValue  = @(0.0f);
    toLayerPositionAnimation.delegate = self;
    [toLayer addAnimation:toLayerPositionAnimation forKey:@"toLayerPositionAnimation"];
    
    CABasicAnimation *toLayerAlphaAnimation = [CABasicAnimation fadeInAnimation];
    toLayerAlphaAnimation.duration = FLCTabBarAnimatorDuration;
    [toLayer addAnimation:toLayerAlphaAnimation forKey:@"toLayerAlphaAnimation"];
    
    /* To */
    CABasicAnimation *fromLayerPositionAnimation = [self animation];
    fromLayerPositionAnimation.toValue  = @(boundaries.size.height * directionCoefficient * -1);
    fromLayerPositionAnimation.delegate = self;
    [fromLayer addAnimation:fromLayerPositionAnimation forKey:@"fromLayerPositionAnimation"];
    
    CABasicAnimation *fromLayerAlphaAnimation = [CABasicAnimation fadeOutAnimation];
    fromLayerAlphaAnimation.duration = FLCTabBarAnimatorDuration;
    [fromLayer addAnimation:fromLayerAlphaAnimation forKey:@"fromLayerAlphaAnimation"];
}

#pragma mark -
#pragma mark - Private
#pragma mark -

#pragma mark - Position Animation

- (CABasicAnimation *)animation
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeBoth;
    animation.duration = FLCTabBarAnimatorDuration;
    return animation;
}


#pragma mark - CABasicAnimationDelegate

- (void)animationDidStop:(CAAnimation *)animation finished:(BOOL)finished
{
    if (self.completionBlock) {
        self.completionBlock(finished);
        self.completionBlock = nil;
    }
}

@end
