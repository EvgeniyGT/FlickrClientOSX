//
//  CABasicAnimation+FadeInOut.h
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/16/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CABasicAnimation (FadeInOut)
+ (CABasicAnimation *)fadeInAnimation;
+ (CABasicAnimation *)fadeOutAnimation;
@end
