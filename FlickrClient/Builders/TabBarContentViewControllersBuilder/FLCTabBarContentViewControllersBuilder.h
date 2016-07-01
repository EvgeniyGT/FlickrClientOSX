//
//  FLCTabBarContentViewControllersBuilder.h
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/22/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface FLCTabBarContentViewControllersBuilder : NSObject

/**
 *  Designated initializer
 *
 *  @param coreDataController HCDCoreDataStackController
 *
 *  @return FLCTabBarContentViewControllersBuilder штыефтсу
 */
- (instancetype)initWitCoreDataController:(HCDCoreDataStackController *)coreDataController;

/**
 *  Build content ViewControllers for FLCTabBarViewController
 *
 *  @return NSArray of NSViewControllers
 */
- (NSArray *)contentViewControllers;

@end
