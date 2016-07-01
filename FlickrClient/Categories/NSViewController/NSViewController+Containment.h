//
//  NSViewController+Containment.h
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/10/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSViewController (Containment)
- (void)showChildViewController:(NSViewController *)child;
- (void)hideChildViewController:(NSViewController *)child;
@end
