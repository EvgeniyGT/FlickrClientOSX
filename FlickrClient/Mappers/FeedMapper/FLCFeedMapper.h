//
//  FLCFeedMapper.h
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/23/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^FLCFeedMapperResultBlock)(NSError *error);

@interface FLCFeedMapper : NSObject

/**
*  Designated initializer
*
*  @param coreDataController HCDCoreDataStackController
*
*  @return FLCFeedMapper instance
*/
- (instancetype)initWithCoreDataController:(HCDCoreDataStackController *)coreDataController;

/**
 *  Map server response
 *
 *  @param feedResponse      NSDictionary
 *  @param erasePreviousData need erase Feeds info from DB before update? 
 *  @param resultBlock       can return NSError if mapping error occurred
 */
- (void)mapFeedResponse:(NSDictionary *)feedResponse
      erasePreviousData:(BOOL)erasePreviousData
            resultBlock:(FLCFeedMapperResultBlock)resultBlock;

@end
