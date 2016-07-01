//
//  FLCResponseHandlerInterface.h
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/23/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^FLCResponseHandlerCompletion)(id <NSFastEnumeration> object, NSError *error);

@protocol FLCResponseHandlerInterface <NSObject>

@required

/**
 *  Proxy method to aggregate networking and API-based errors
 *  @note Extended version of - (void)extractErrorFromResponse:(id)responseObject networkError:(NSError *)networkError completion:(FLCResponseHandlerCompletion)completion. If this one is implemented this method is responsive for error aggregation
 *
 *  @param responseObject id                            object representing response received from backend
 *  @param networkError   NSError                       error representing network layer error
 *  @param method         NSString
 *  @param parameters     id
 *  @param completion     FLCResponseHandlerCompletion
 */
- (void)extractErrorFromResponse:(id)responseObject
                    networkError:(NSError *)networkError
                        endpoint:(NSString *)endpoint
                          method:(NSString *)method
                      parameters:(id)parameters
                      completion:(FLCResponseHandlerCompletion)completion;

@end
