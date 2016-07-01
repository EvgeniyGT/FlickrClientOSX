//
//  NSColor+HexString.h
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/16/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSColor (HexString)
+ (NSColor *)colorWithHexString:(NSString *)hexString;
@end
