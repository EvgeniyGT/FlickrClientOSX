//
//  NSStoryboardSegue+SegueDestination.m
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/15/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import "NSStoryboardSegue+SegueDestination.h"

@implementation NSStoryboardSegue (SegueDestination)

- (BOOL)isSegueToClass:(Class)class
{
    NSString * probableIdentifier = [NSString stringWithFormat:@"%@", NSStringFromClass(class)];
    if ([probableIdentifier isEqualToString:self.identifier]) {
        return YES;
    }
    return NO;
}

@end
