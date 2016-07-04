//
//  FLCFeedLoader.m
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/23/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import "FLCFeedLoader.h"
#import "FLCRequestManager.h"
#import "FLCFeedMapper.h"
#import "FLCAPIDefinitions.h"
#import "FLCFeedAPIResponseHandler.h"

/* Request Keys */
static NSString * const FLCFeedLoaderRequestKeyMethod   = @"method";
static NSString * const FLCFeedLoaderRequestKeyAPIKey   = @"api_key";
static NSString * const FLCFeedLoaderRequestKeyPerPage  = @"per_page";
static NSString * const FLCFeedLoaderRequestKeyFormat   = @"format";
static NSString * const FLCFeedLoaderRequestKeyCallBack = @"nojsoncallback";
static NSString * const FLCFeedLoaderRequestKeyExtras   = @"extras";
static NSString * const FLCFeedLoaderRequestKeyPage     = @"page";

/* Default Request Values */
static NSString * const FLCFeedLoaderFormatValue        = @"json";
static NSString * const FLCFeedLoaderURLExtrasValue     = @"url_l";
static NSUInteger const FLCFeedLoaderPerPageValue       = 30;

@interface FLCFeedLoader ()
@property (nonatomic, readwrite) FLCRequestManager *requestManager;
@property (nonatomic, readwrite) FLCFeedMapper *feedMapper;
@end

@implementation FLCFeedLoader

#pragma mark - Init

+ (instancetype)loaderWithMapper:(FLCFeedMapper *)mapper
{
    /* Request manager */
    FLCAPIConfiguration *configuration = [[FLCAPIConfiguration alloc] initWithRequestSerializer:[AFHTTPRequestSerializer serializer]
                                                                             responseSerializer:[AFJSONResponseSerializer serializer]
                                                                                responseHandler:[FLCFeedAPIResponseHandler new]];
    FLCRequestManager *requestManager = nil;
    requestManager = [[FLCRequestManager alloc] initWithConfiguration:configuration];
    
    return [[[self class] alloc] initWithRequestManager:requestManager feedMapper:mapper];
}

- (instancetype)initWithRequestManager:(FLCRequestManager *)requestManager
                            feedMapper:(FLCFeedMapper *)feedMapper
{
    self = [super init];
    if (self) {
        _requestManager = requestManager;
        _feedMapper = feedMapper;
    }
    return self;
}

#pragma mark -
#pragma mark - Public
#pragma mark - 

- (void)syncFeedWithResultBlock:(FLCFeedLoaderBlock)resultBlock
{
    [self requestFeedsWithParams:[self requestParamsForPage:1]
               erasePreviousData:YES
                     resultBlock:resultBlock];
}

- (void)syncFeedForPage:(NSInteger)page resultBlock:(FLCFeedLoaderBlock)resultBlock
{
    [self requestFeedsWithParams:[self requestParamsForPage:page]
               erasePreviousData:NO
                     resultBlock:resultBlock];
}

#pragma mark -
#pragma mark - Private
#pragma mark -

- (void)requestFeedsWithParams:(NSDictionary *)requestParams
             erasePreviousData:(BOOL)erasePreviousData
                   resultBlock:(FLCFeedLoaderBlock)resultBlock
{
    weak_self weakSelf = self;
    [self.requestManager runGETRequestWithEndpoint:FLCRESTAPIPath parameters:requestParams completion:^(id object, NSError *error) {
        if (!error && object) {
            [weakSelf.feedMapper mapFeedResponse:object erasePreviousData:erasePreviousData resultBlock:^(NSError *error) {
                safe_block(resultBlock, error == nil, error);
            }];
        } else {
            safe_block(resultBlock, NO, error);
        }
    }];
}

- (NSDictionary *)requestParamsForPage:(NSInteger)page
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:FLCFeedRESTMethod forKey:FLCFeedLoaderRequestKeyMethod];
    [params setObject:FLCAPIKey forKey:FLCFeedLoaderRequestKeyAPIKey];
    [params setObject:@(FLCFeedLoaderPerPageValue) forKey:FLCFeedLoaderRequestKeyPerPage];
    [params setObject:FLCFeedLoaderFormatValue forKey:FLCFeedLoaderRequestKeyFormat];
    [params setObject:@(1) forKey:FLCFeedLoaderRequestKeyCallBack];
    [params setObject:FLCFeedLoaderURLExtrasValue forKey:FLCFeedLoaderRequestKeyExtras];
    [params setObject:@(page) forKey:FLCFeedLoaderRequestKeyPage];
    return params;
}

@end
