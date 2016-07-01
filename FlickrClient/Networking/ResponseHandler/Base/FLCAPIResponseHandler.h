//
//  FLCAPIResponseHandler.h
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/23/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FLCResponseHandlerInterface.h"

static NSString * const FLCRequestErrorHandlerDomain          = @"com.flcerrorhandler.domain";

@interface FLCAPIResponseHandler : NSObject <FLCResponseHandlerInterface>

@end
