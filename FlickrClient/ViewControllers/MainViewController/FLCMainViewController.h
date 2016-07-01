//
//  FLCMainViewController.h
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/14/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FLCTabBarViewController.h"

@interface FLCMainViewController : NSViewController

/* Main TabBar Controller */
@property (weak, nonatomic, readonly) FLCTabBarViewController *tabBarViewController;

@end
