//
//  FLCRequestManager.m
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/23/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import "FLCRequestManager.h"
#import "FLCRequestManager.h"
#import "FLCAPIResponseHandler.h"

@interface FLCRequestManager ()

@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;
@property (nonatomic, strong) FLCAPIResponseHandler *responseHandler;

@end

@implementation FLCRequestManager

- (instancetype)initWithConfiguration:(FLCAPIConfiguration *)configuration
{
    self = [super init];
    if (self) {
        /* The config */
        _configuration = configuration;

        /* Response handler */
        _responseHandler = configuration.responseHandler;
    }
    return self;
}

#pragma mark -
#pragma mark - HTTP Routines
#pragma mark -

#pragma mark - GET

- (void)runGETRequestWithEndpoint:(NSString *)endpointPath parameters:(id)parameters completion:(FLCRequestManagerCompletionBlock)completionBlock
{
    __weak __typeof(self) weakSelf = self;
    [self.sessionManager GET:endpointPath parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [weakSelf extractBody:responseObject error:nil endpoint:endpointPath method:FLCRequestManagerRequestMethodGET parameters:parameters completion:completionBlock];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [weakSelf extractBody:nil error:error endpoint:endpointPath method:FLCRequestManagerRequestMethodGET parameters:parameters completion:completionBlock];
    }];
}

#pragma mark - POST

- (void)runPOSTRequestWithEndpoint:(NSString *)endpointPath parameters:(id)parameters completion:(FLCRequestManagerCompletionBlock)completionBlock
{
    __weak __typeof(self) weakSelf = self;
    [self.sessionManager POST:endpointPath parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [weakSelf extractBody:responseObject error:nil endpoint:endpointPath method:FLCRequestManagerRequestMethodPOST parameters:parameters completion:completionBlock];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [weakSelf extractBody:nil error:error endpoint:endpointPath method:FLCRequestManagerRequestMethodPOST parameters:parameters completion:completionBlock];
    }];
}

#pragma mark - PUT

- (void)runPUTRequestWithEndpoint:(NSString *)endpointPath parameters:(id)parameters completion:(FLCRequestManagerCompletionBlock)completionBlock
{
    __weak __typeof(self) weakSelf = self;
    [self.sessionManager PUT:endpointPath parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {

        [weakSelf extractBody:responseObject error:nil endpoint:endpointPath method:FLCRequestManagerRequestMethodPUT parameters:parameters completion:completionBlock];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {

        [weakSelf extractBody:nil error:error endpoint:endpointPath method:FLCRequestManagerRequestMethodPUT parameters:parameters completion:completionBlock];
    }];
}

#pragma mark - DELETE

- (void)runDELETERequestWithEndpoint:(NSString *)endpointPath parameters:(id)parameters completion:(FLCRequestManagerCompletionBlock)completionBlock
{
    __weak __typeof(self) weakSelf = self;
    [self.sessionManager DELETE:endpointPath parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {

        [weakSelf extractBody:responseObject error:nil endpoint:endpointPath method:FLCRequestManagerRequestMethodDELETE parameters:parameters completion:completionBlock];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {

        [weakSelf extractBody:nil error:error endpoint:endpointPath method:FLCRequestManagerRequestMethodDELETE parameters:parameters completion:completionBlock];
    }];
}

#pragma mark -
#pragma mark - Private
#pragma mark -

- (void)extractBody:(id)object
              error:(NSError *)error
           endpoint:(NSString *)endpoint
             method:(NSString *)method
         parameters:(id)parameters
         completion:(FLCRequestManagerCompletionBlock)completionBlock
{
    [self.responseHandler extractErrorFromResponse:object networkError:error endpoint:endpoint method:method parameters:parameters completion:^(id object, NSError *error) {
        completionBlock(object, error);
    }];
}

- (void)cancel
{
    [[self.sessionManager tasks] enumerateObjectsUsingBlock:^(NSURLSessionTask *task, NSUInteger idx, BOOL *stop) {
        [task cancel];
    }];
}

#pragma mark - Private

- (AFHTTPSessionManager *)sessionManager
{
    if (_sessionManager == nil) {

        /* Setup session configuration */
        NSURL *baseAPIURL = [NSURL URLWithString:self.configuration.baseURLPath];
        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];

        /* Create an instance */
        self.sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseAPIURL sessionConfiguration:sessionConfiguration];
        self.sessionManager.responseSerializer = self.configuration.responseSerializer;
        self.sessionManager.requestSerializer = self.configuration.requestSerializer;
    }
    return _sessionManager;
}

@end
