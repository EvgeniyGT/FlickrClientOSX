//
//  CABasicAnimation+FadeInOut.m
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/16/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import "CABasicAnimation+FadeInOut.h"

@implementation CABasicAnimation (FadeInOut)

+ (CABasicAnimation *)fadeInAnimation
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue = @(0.0f);
    animation.toValue = @(1.0f);
    return animation;
}

+ (CABasicAnimation *)fadeOutAnimation
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue = @(1.0f);
    animation.toValue = @(0.1f);
    return animation;
}

@end
