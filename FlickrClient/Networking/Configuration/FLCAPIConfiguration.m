//
//  FLCAPIConfiguration.m
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/23/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import "FLCAPIConfiguration.h"
#import "FLCAPIDefinitions.h"
#import "FLCBaseRequestSerializer.h"
#import "FLCBaseJSONSerializer.h"
#import "FLCAPIResponseHandler.h"

@interface FLCAPIConfiguration ()

@property (nonatomic, strong, readwrite) AFHTTPRequestSerializer *requestSerializer;
@property (nonatomic, strong, readwrite) AFHTTPResponseSerializer *responseSerializer;
@property (nonatomic, strong, readwrite) id <FLCResponseHandlerInterface> responseHandler;

@end

@implementation FLCAPIConfiguration

+ (instancetype)defaultConfiguration
{
    return [[self alloc] initWithRequestSerializer:[FLCBaseRequestSerializer serializer]
                                responseSerializer:[FLCBaseJSONSerializer serializer]
                                   responseHandler:[FLCAPIResponseHandler new]];
}

- (instancetype)initWithRequestSerializer:(AFHTTPRequestSerializer *)requestSerializer
                       responseSerializer:(AFHTTPResponseSerializer *)responseSerializer
                          responseHandler:(id <FLCResponseHandlerInterface>)responseHandler
{
    self = [super init];
    if (self) {
        _requestSerializer = requestSerializer;
        _responseSerializer = responseSerializer;
        _responseHandler = responseHandler;
    }
    return self;
}

#pragma mark - Public Getters

- (NSString *)baseURLPath
{
    return FLCAPIEndpoint;
}


@end
