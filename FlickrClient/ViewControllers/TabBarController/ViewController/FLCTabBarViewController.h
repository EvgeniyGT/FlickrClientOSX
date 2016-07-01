//
//  FLCTabBarViewController.h
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/10/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface FLCTabBarViewController : NSViewController

/**
 *  Presented View Conteroller
 */
@property (weak, nonatomic) NSViewController *selectedViewController;

/**
 *  TabBar ViewControllers
 */
@property (strong, nonatomic) NSArray *viewControllers;

/**
 *  Current selection
 */
@property (assign, nonatomic) NSUInteger selectedIndex;

@end
