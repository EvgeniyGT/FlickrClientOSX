//
//  FLCAPIConfiguration.h
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/23/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

#import "FLCResponseHandlerInterface.h"

@interface FLCAPIConfiguration : NSObject

/**
 *  Returns default configuration instance
 *
 *  @note default configuraton will have AFHTTPRequestSerializer and AFJSONResponseSerializer
 *  @return FLCAPIConfiguration instance
 */
+ (instancetype)defaultConfiguration;

/**
 *  Designated initializer
 *
 *  @param requestSerializer  AFHTTPRequestSerializer   request serializer
 *  @param responseSerializer AFHTTPResponseSerializer  response serializer
 *  @param responseHandler    id <FLCResponseHandler>   object conforming to FLCResponseHandler protocol for request errors aggregating
 *
 *  @return FLCAPIConfiguration instance
 */
- (instancetype)initWithRequestSerializer:(AFHTTPRequestSerializer *)requestSerializer
                       responseSerializer:(AFHTTPResponseSerializer *)responseSerializer
                          responseHandler:(id <FLCResponseHandlerInterface>)responseHandler;

/**
 *  Represents current request serializer
 */
@property (nonatomic, strong, readonly) AFHTTPRequestSerializer *requestSerializer;

/**
 *  Represents current response serializer
 */
@property (nonatomic, strong, readonly) AFHTTPResponseSerializer *responseSerializer;

/**
 *  Object conforming to FLCResponseHandler protocol wich aggregates backend response and network and backend level errors
 */
@property (nonatomic, strong, readonly) id <FLCResponseHandlerInterface> responseHandler;

/**
 *  API endpoint getter
 */
@property (nonatomic, strong, readonly) NSString *baseURLPath;


@end
