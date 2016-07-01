//
//  FLCAPIResponseHandler.m
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/23/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import "FLCAPIResponseHandler.h"
#import "FLCAPIErrorMapper.h"

@implementation FLCAPIResponseHandler

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
    
    /* Server response */
    if (completion) {
        completion(responseObject, nil);
    }
}

@end
