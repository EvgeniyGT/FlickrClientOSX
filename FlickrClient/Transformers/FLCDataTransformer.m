//
//  FCLDataTransformer.m
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 7/28/15.
//  Copyright (c) 2015 Alterplay. All rights reserved.
//

#import "FLCDataTransformer.h"

@implementation FLCDataTransformer

+ (NSNumber *)timestampFromDateValue:(NSDate *)value
{
    if (value == nil) {
        return nil;
    }
    return @(ceil([value timeIntervalSince1970]));
}

+ (id)dateFromTimeStampValue:(id)value
{
    if ([value respondsToSelector:@selector(doubleValue)]) {
        NSTimeInterval createTime = [value doubleValue];
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:createTime];
        return date;
    }
    return [NSNull null];
}

+ (id)integerNumberFromValue:(id)value
{
    if ([value isKindOfClass:[NSNull class]]) {
        return value;
    }
    if ([value respondsToSelector:@selector(unsignedLongLongValue)]) {
        return @([value unsignedLongLongValue]);
    }
    if ([value respondsToSelector:@selector(integerValue)]) {
        return @([value integerValue]);
    }
    return [NSNull null];
}

+ (id)doubleNumberFromValue:(id)value
{
    if ([value isKindOfClass:[NSNull class]]) {
        return value;
    }
    if ([value respondsToSelector:@selector(doubleValue)]) {
        return @([value doubleValue]);
    }
    return [NSNull null];
}

+ (id)boolNumberFromValue:(id)value
{
    if ([value isKindOfClass:[NSNull class]]) {
        return value;
    }
    if ([value respondsToSelector:@selector(boolValue)]) {
        return @([value boolValue]);
    }
    return [NSNull null];
}

+ (NSString *)jsonStringFromStringValue:(NSString *)value
{
    if ([value isKindOfClass:[NSString class]]) {
        NSString *string = value;
        if (string.length > 0) {
            return value;
        } else {
            return @"null";
        }
    }
    return @"null";
}

@end
