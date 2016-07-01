//
//  FLCFeedAPIResponseHandler.m
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/24/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import "FLCFeedAPIResponseHandler.h"
#import "FLCAPIErrorMapper.h"

static NSString * const FLCFeedAPIResponseStatKey        = @"stat";
static NSString * const FLCFeedAPIResponseStatOKValue    = @"ok";

@implementation FLCFeedAPIResponseHandler

#pragma mark - FLCResponseHandlerInterface

- (void)extractErrorFromResponse:(id)responseObject
                    networkError:(NSError *)networkError
                        endpoint:(NSString *)endpoint
                          method:(NSString *)method
                      parameters:(id)parameters
                      completion:(FLCResponseHandlerCompletion)completion
{
    /* We've got network error */
    if (networkError) {
        /* Notify network error */
        if (completion) {
            completion(nil, [FLCAPIErrorMapper errorObjectWithNetworkError:networkError]);
        }
        return;
    }
    
    /* Response is a dictionary */
    if ([responseObject isKindOfClass:[NSDictionary class]]) {
        
        /* Grab the status */
        NSString *status = [responseObject valueForKey:FLCFeedAPIResponseStatKey];
        
        /* Everything is fine */
        if ([status isEqualToString:FLCFeedAPIResponseStatOKValue]) {
            completion(responseObject, nil);
        } else {
            /* Something is wrong */
            completion(nil, [FLCAPIErrorMapper wrongResponseFormatError]);
        }
    } else {
        /* Format is wrong */
        completion(nil, [FLCAPIErrorMapper wrongResponseFormatError]);
    }
}

@end
