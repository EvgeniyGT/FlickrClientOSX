//
//  NSViewController+SegueDestination.m
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/15/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import "NSViewController+SegueDestination.h"

@implementation NSViewController (SegueDestination)

- (void)performSegueToClass:(Class)class sender:(id)sender;
{
    NSString *identifier = [NSString stringWithFormat:@"%@", NSStringFromClass(class)];
    [self performSegueWithIdentifier:identifier
                              sender:sender];
}

- (void)performSegueToClass:(Class)class
{
    [self performSegueToClass:class sender:self];
}

@end
