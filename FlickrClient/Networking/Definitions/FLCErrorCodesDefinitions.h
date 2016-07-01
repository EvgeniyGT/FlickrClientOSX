//
//  FLCErrorCodesDefinitions.h
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/23/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#ifndef FLCErrorCodesDefinitions_h
#define FLCErrorCodesDefinitions_h

typedef NS_ENUM(NSInteger, FLCAPIErrorCode) {
    
    /* CFNetwork */
    FLCAPIErrorCodeHostNotFound        = -1003,
    FLCAPIErrorCodeNoConnection        = -1009,
    
    /* Formats */
    FLCAPIErrorCodeBadResponse         = 5001,
    FLCAPIErrorCodeConnection          = 6001,
    FLCAPIErrorCodeConnectionCancelled = 7001,
};


#endif /* FLCErrorCodesDefinitions_h */
