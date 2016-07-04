//
//  FLCTabBarAnimator.h
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/10/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

typedef void (^FLCTabBarAnimatorCompletionBlock)(BOOL finished);

typedef NS_ENUM(NSUInteger, FLCTabBarAnimationDirection) {
    FLCTabBarAnimationFromUpToDown,
    FLCTabBarAnimationFromDownToUp
};

@interface FLCTabBarAnimator : NSObject

/**
 *  Animate TabBar content VCs
 *
 *  @param fromViewController NSViewController
 *  @param toViewController   NSViewController
 *  @param direction          FLCTabBarAnimationDirection
 *  @param boundaries         TabBarController bounds
 *  @param completionBlock    Animation finish block
 */
- (void)animateFromViewController:(NSViewController *)fromViewController
                 toViewController:(NSViewController *)toViewController
                        direction:(FLCTabBarAnimationDirection)direction
                     inBoundaries:(CGRect)boundaries
                  completionBlock:(FLCTabBarAnimatorCompletionBlock)completionBlock;

@end
