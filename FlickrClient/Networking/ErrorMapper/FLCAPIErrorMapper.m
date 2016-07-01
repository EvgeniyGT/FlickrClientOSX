//
//  FLCAPIErrorMapper.m
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/23/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import "FLCAPIErrorMapper.h"
#import "FLCErrorCodesDefinitions.h"
#import "FLCAPIResponseHandler.h"

@implementation FLCAPIErrorMapper

#pragma mark - Public

+ (NSError *)wrongResponseFormatError
{
    NSDictionary *userInfo = @{NSLocalizedDescriptionKey:NSLocalizedString(@"Wrong response format", nil)};
    NSError *error = [NSError errorWithDomain:FLCRequestErrorHandlerDomain code:FLCAPIErrorCodeBadResponse userInfo:userInfo];
    return error;
}

+ (NSError *)errorObjectWithNetworkError:(NSError *)error
{
    NSInteger code = error.code;
    NSError *underlyingError = error.userInfo[NSUnderlyingErrorKey];
    NSString *errorReason = underlyingError.userInfo[NSLocalizedDescriptionKey];
    
    if (code == kCFURLErrorCancelled) {
        code = FLCAPIErrorCodeConnectionCancelled;
        errorReason = [FLCRequestErrorHandlerRequestCancelledErrorDescription copy];
    } else if (!errorReason) {
        errorReason = [FLCRequestErrorHandlerAPINotReachableErrorDescription copy];
        code = FLCAPIErrorCodeConnection;
    }
    
    NSDictionary *userInfo = @{NSLocalizedDescriptionKey:errorReason};
    return [NSError errorWithDomain:FLCRequestErrorHandlerDomain code:code userInfo:userInfo];
}

@end
