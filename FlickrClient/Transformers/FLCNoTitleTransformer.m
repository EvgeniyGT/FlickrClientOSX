//
//  FLCNoTitleTransformer.m
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 7/4/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import "FLCNoTitleTransformer.h"

@implementation FLCNoTitleTransformer

+ (Class)transformedValueClass
{
    return [NSString class];
}

+ (BOOL)allowsReverseTransformation
{
    return NO;
}

- (id)transformedValue:(id)value
{
    NSString *stringValue = value;
    if (stringValue.length == 0) {
        stringValue = NSLocalizedString(@"[NO TITLE]", nil);
    }
    return stringValue;
}

@end
