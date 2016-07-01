//
//  NSViewController+Containment.m
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/10/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import "NSViewController+Containment.h"

@implementation NSViewController (Containment)

- (void)showChildViewController:(NSViewController *)child
{
    [self addChildViewController:child];
    child.view.frame = self.view.bounds;
    [self.view addSubview:child.view];
}

- (void)hideChildViewController:(NSViewController *)child
{
    [child.view removeFromSuperview];
    [child removeFromParentViewController];
}


@end
