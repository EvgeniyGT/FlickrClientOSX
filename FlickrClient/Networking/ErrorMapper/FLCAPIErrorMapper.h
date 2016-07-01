//
//  FLCAPIErrorMapper.h
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/23/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const FLCRequestErrorHandlerAPINotReachableErrorDescription  = @"Connection error.\nPlease try again later.";
static NSString * const FLCRequestErrorHandlerRequestCancelledErrorDescription = @"Request was cancelled";

@interface FLCAPIErrorMapper : NSObject

/**
 *  Creates corresponding NSError with predefined values
 *
 *  @return NSError instance
 */
+ (NSError *)wrongResponseFormatError;

/**
 *  Maps given network error to NSError
 *
 *  @param error NSError with CFNetwork info
 *
 *  @return NSError instance
 */
+ (NSError *)errorObjectWithNetworkError:(NSError *)error;

@end
