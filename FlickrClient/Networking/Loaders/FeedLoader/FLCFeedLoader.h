//
//  FLCFeedLoader.h
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/23/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FLCRequestManager;
@class FLCFeedMapper;

typedef void(^FLCFeedLoaderBlock)(BOOL success, NSError *error);

@interface FLCFeedLoader : NSObject

/**
*  Convenience initializer
*
*  @param mapper FLCFeedMapper
*
*  @return FLCFeedLoader instance with predefinded RequestManager
*/
+ (instancetype)loaderWithMapper:(FLCFeedMapper *)mapper;

/**
 *  Designated Initializer
 *
 *  @param requestManager FLCRequestManager instance
 *  @param feedMapper     FLCFeedMapper instance
 *
 *  @return FLCFeedLoader instance
 */
- (instancetype)initWithRequestManager:(FLCRequestManager *)requestManager
                            feedMapper:(FLCFeedMapper *)feedMapper;

/**
 *  Full reload of feed
 *  Note: Previous feed will be erased from DB.
 *
 *  @param resultBlock resultBlock operation status
 */
- (void)syncFeedWithResultBlock:(FLCFeedLoaderBlock)resultBlock;

/**
 *  Load and store feed page
 *
 *  @param page        page number
 *  @param resultBlock resultBlock operation status
 */
- (void)syncFeedForPage:(NSInteger)page resultBlock:(FLCFeedLoaderBlock)resultBlock;

@end
