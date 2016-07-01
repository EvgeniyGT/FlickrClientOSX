//
//  FLCColorizedView.m
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/30/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import "FLCColorizedView.h"

@implementation FLCColorizedView

#pragma mark - Setter

- (void)setBackgroundColor:(NSColor *)backgroundColor
{
    _backgroundColor = backgroundColor;
    self.wantsLayer = YES;
    self.layer.backgroundColor = _backgroundColor.CGColor;
}

@end
