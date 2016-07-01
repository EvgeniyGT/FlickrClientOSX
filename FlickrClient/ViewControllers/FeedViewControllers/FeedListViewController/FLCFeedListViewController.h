//
//  FLCFeedListViewController.h
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/22/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface FLCFeedListViewController : NSViewController

/**
 *  CoreData controller
 */
@property (strong, nonatomic) HCDCoreDataStackController *coreDataController;

@end
