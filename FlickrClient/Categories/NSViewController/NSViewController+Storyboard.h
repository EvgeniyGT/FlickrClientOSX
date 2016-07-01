//
//  NSViewController+Storyboard.h
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/10/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSViewController (Storyboard)
+ (instancetype)controllerFromStoryboardWithName:(NSString *)storyboardName;
@end
