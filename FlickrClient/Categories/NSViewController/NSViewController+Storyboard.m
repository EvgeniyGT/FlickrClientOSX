//
//  NSViewController+Storyboard.m
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/10/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import "NSViewController+Storyboard.h"

@implementation NSViewController (Storyboard)

+ (instancetype)controllerFromStoryboardWithName:(NSString *)storyboardName
{
    NSStoryboard *storyboard = [NSStoryboard storyboardWithName:storyboardName bundle:nil];
    return [storyboard instantiateControllerWithIdentifier:NSStringFromClass(self)];
}

@end
