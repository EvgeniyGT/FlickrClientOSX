//
//  FLCFeedListArrayController.m
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/30/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import "FLCFeedListArrayController.h"

@implementation FLCFeedListArrayController

#pragma mark - Init

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithContent:(id)content
{
    self = [super initWithContent:content];
    if (self) {
        [self commonInit];
    }
    return self;
}

#pragma mark - Setup

- (void)commonInit
{
    self.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"remoteId" ascending:YES]];
    self.filterPredicate = [NSPredicate predicateWithFormat:@"title != nil AND url != nil"];
}

@end
