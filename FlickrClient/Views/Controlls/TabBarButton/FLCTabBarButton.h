//
//  FLCTabBarButton.h
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/15/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface FLCTabBarButton : NSButton

/* Selected/Unselected state */
@property (assign, nonatomic, getter=isSelected) BOOL selected;

@end
