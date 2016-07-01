//
//  FLCRequestManager.h
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/23/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FLCAPIConfiguration.h"

static NSString * const FLCRequestManagerRequestMethodGET     = @"GET";
static NSString * const FLCRequestManagerRequestMethodPOST    = @"POST";
static NSString * const FLCRequestManagerRequestMethodPUT     = @"PUT";
static NSString * const FLCRequestManagerRequestMethodDELETE  = @"DELETE";

typedef void(^FLCRequestManagerCompletionBlock)(id object, NSError *error);

@interface FLCRequestManager : NSObject

/**
 *  Instantiate manager with given configuration
 *
 *  @param configuration FLCAPIConfiguration
 *
 *  @return FLCRequestManager instance
 */
- (instancetype)initWithConfiguration:(FLCAPIConfiguration *)configuration;

/**
 *  Current configuration. Settable via constructor
 */
@property (nonatomic, strong, readonly) FLCAPIConfiguration *configuration;

/**
 *  Runs GET request
 *
 *  @param endpointPath    NSString. Endpoint path
 *  @param parameters      id parameters. Could be NSDictionary or NSArray
 *  @param completionBlock FLCRequestManagerCompletionBlock completion
 */
- (void)runGETRequestWithEndpoint:(NSString *)endpointPath parameters:(id)parameters completion:(FLCRequestManagerCompletionBlock)completionBlock;

/**
 *  Runs POST request
 *
 *  @param endpointPath    NSString. Endpoint path
 *  @param parameters      id parameters. Could be NSDictionary or NSArray
 *  @param completionBlock FLCRequestManagerCompletionBlock completion
 */
- (void)runPOSTRequestWithEndpoint:(NSString *)endpointPath parameters:(id)parameters completion:(FLCRequestManagerCompletionBlock)completionBlock;

/**
 *  Runs PUT request
 *
 *  @param endpointPath    NSString. Endpoint path
 *  @param parameters      id parameters. Could be NSDictionary or NSArray
 *  @param completionBlock FLCRequestManagerCompletionBlock completion
 */
- (void)runPUTRequestWithEndpoint:(NSString *)endpointPath parameters:(id)parameters completion:(FLCRequestManagerCompletionBlock)completionBlock;


/**
 *  Runs DELETE request
 *
 *  @param endpointPath    NSString. Endpoint path
 *  @param parameters      id parameters. Could be NSDictionary or NSArray
 *  @param completionBlock FLCRequestManagerCompletionBlock completion
 */
- (void)runDELETERequestWithEndpoint:(NSString *)endpointPath parameters:(id)parameters completion:(FLCRequestManagerCompletionBlock)completionBlock;

/**
 *  Cancels all running requests
 */
- (void)cancel;

@end
