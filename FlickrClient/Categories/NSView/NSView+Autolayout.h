//
//  NSView+Autolayout.h
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/10/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSView (Autolayout)
- (void)layoutToParentView:(NSView *)parentView;
- (void)layoutToParentView:(NSView *)parentView topConstant:(CGFloat)constant;
- (void)layoutToParentView:(NSView *)parentView rightConstant:(CGFloat)constant;
- (void)layoutToParentView:(NSView *)parentView bottomConstant:(CGFloat)constant;
- (void)layoutToParentView:(NSView *)parentView
     topConstraintConstant:(CGFloat)topConstraintConstant
    leftConstraintConstant:(CGFloat)leftConstraintConstant
   rightConstraintConstant:(CGFloat)rightConstraintConstant
  bottomConstraintConstant:(CGFloat)bottomConstraintConstant;

- (void)positionedInCenterOfParentView:(NSView *)parentView;
- (void)positionedInCenterOfParentView:(NSView *)parentView topOffset:(CGFloat)offset;
- (void)positionedInCenterOfView:(NSView *)parentView withXMargins:(CGFloat)margin;

- (void)positionedInTopOfParentView:(NSView *)parentView;
- (void)positionedInLeftOfParentView:(NSView *)parentView leftOffset:(CGFloat)offset topOffset:(CGFloat)topOffset;
- (void)positionedInBottomOfParentView:(NSView *)parentView;
- (void)positionedInBottomOfParentView:(NSView *)parentView bottomOffset:(CGFloat)offset;
@end
