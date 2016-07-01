//
//  FLCTabBarButton.m
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/15/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import "FLCTabBarButton.h"

@implementation FLCTabBarButton

#pragma mark - Init

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    [self setButtonType:NSMomentaryChangeButton];
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setAlignment:NSCenterTextAlignment];
    NSDictionary *attrsDictionary  = @{NSForegroundColorAttributeName: [NSColor whiteColor],
                                       NSFontAttributeName: [NSFont fontWithName:@"AvenirNext-Medium" size:12.0f],
                                       NSParagraphStyleAttributeName: style};
    NSAttributedString *attrString = [[NSAttributedString alloc]initWithString:self.title attributes:attrsDictionary];
    [self setAttributedTitle:attrString];
}

#pragma mark - Setter

- (void)setSelected:(BOOL)selected
{
    _selected = selected;
    
    /* Update UI */
    if (!self.layer) [self setWantsLayer:YES];
    self.layer.opacity = selected ? 1.0f : 0.2f;
}

@end
