//
//  NSViewController+SegueDestination.h
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/15/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSViewController (SegueDestination)
- (void)performSegueToClass:(Class)class sender:(id)sender;
- (void)performSegueToClass:(Class)class;
@end
