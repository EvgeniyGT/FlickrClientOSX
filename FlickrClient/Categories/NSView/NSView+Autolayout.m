//
//  NSView+Autolayout.m
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/10/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import "NSView+Autolayout.h"

@implementation NSView (Autolayout)

- (void)layoutToParentView:(NSView *)parentView
{
    [self layoutToParentView:parentView
       topConstraintConstant:0.0f
      leftConstraintConstant:0.0f
     rightConstraintConstant:0.0f
    bottomConstraintConstant:0.0f];
}

- (void)layoutToParentView:(NSView *)parentView topConstant:(CGFloat)constant
{
    [self layoutToParentView:parentView
       topConstraintConstant:constant
      leftConstraintConstant:0.0f
     rightConstraintConstant:0.0f
    bottomConstraintConstant:0.0f];
}

- (void)layoutToParentView:(NSView *)parentView rightConstant:(CGFloat)constant
{
    [self layoutToParentView:parentView
       topConstraintConstant:0.0f
      leftConstraintConstant:0.0f
     rightConstraintConstant:constant
    bottomConstraintConstant:0.0f];
}

- (void)layoutToParentView:(NSView *)parentView bottomConstant:(CGFloat)constant
{
    [self layoutToParentView:parentView
       topConstraintConstant:0.0f
      leftConstraintConstant:0.0f
     rightConstraintConstant:0.0f
    bottomConstraintConstant:constant];
}

- (void)layoutToParentView:(NSView *)parentView
     topConstraintConstant:(CGFloat)topConstraintConstant
    leftConstraintConstant:(CGFloat)leftConstraintConstant
   rightConstraintConstant:(CGFloat)rightConstraintConstant
  bottomConstraintConstant:(CGFloat)bottomConstraintConstant
{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self
                                                                      attribute:NSLayoutAttributeLeft
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:parentView
                                                                      attribute:NSLayoutAttributeLeft
                                                                     multiplier:1.0f
                                                                       constant:leftConstraintConstant];
    
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self
                                                                     attribute:NSLayoutAttributeTop
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:parentView
                                                                     attribute:NSLayoutAttributeTop
                                                                    multiplier:1.0f
                                                                      constant:topConstraintConstant];
    
    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:self
                                                                       attribute:NSLayoutAttributeRight
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:parentView
                                                                       attribute:NSLayoutAttributeRight
                                                                      multiplier:1.0f
                                                                        constant:rightConstraintConstant];
    
    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:self
                                                                        attribute:NSLayoutAttributeBottom
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:parentView
                                                                        attribute:NSLayoutAttributeBottom
                                                                       multiplier:1.0f
                                                                         constant:bottomConstraintConstant];
    [parentView addConstraints:@[leftConstraint,
                                 topConstraint,
                                 rightConstraint,
                                 bottomConstraint]];
    [parentView layoutSubtreeIfNeeded];
}


- (void)positionedInCenterOfParentView:(NSView *)parentView
{
    [self positionedInCenterOfParentView:parentView topOffset:0.0f];
}

- (void)positionedInCenterOfParentView:(NSView *)parentView topOffset:(CGFloat)offset
{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:self
                                                                       attribute:NSLayoutAttributeWidth
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:nil
                                                                       attribute:NSLayoutAttributeWidth
                                                                      multiplier:1.0f
                                                                        constant:self.frame.size.width];
    
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:self
                                                                        attribute:NSLayoutAttributeHeight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeHeight
                                                                       multiplier:1.0f
                                                                         constant:self.frame.size.height];
    
    NSLayoutConstraint *centerXConstraint = [NSLayoutConstraint constraintWithItem:self
                                                                         attribute:NSLayoutAttributeCenterX
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:parentView
                                                                         attribute:NSLayoutAttributeCenterX
                                                                        multiplier:1.0f
                                                                          constant:0.0f];
    
    NSLayoutConstraint *centerYConstraint = [NSLayoutConstraint constraintWithItem:self
                                                                         attribute:NSLayoutAttributeCenterY
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:parentView
                                                                         attribute:NSLayoutAttributeCenterY
                                                                        multiplier:1.0f
                                                                          constant:offset];
    [parentView addConstraints:@[widthConstraint,
                                 heightConstraint,
                                 centerXConstraint,
                                 centerYConstraint]];
    [parentView layoutSubtreeIfNeeded];
}

- (void)positionedInCenterOfView:(NSView *)parentView withXMargins:(CGFloat)margin
{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self
                                                                      attribute:NSLayoutAttributeLeft
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:parentView
                                                                      attribute:NSLayoutAttributeLeft
                                                                     multiplier:1.0f
                                                                       constant:margin];
    
    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:self
                                                                       attribute:NSLayoutAttributeRight
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:parentView
                                                                       attribute:NSLayoutAttributeRight
                                                                      multiplier:1.0f
                                                                        constant:-margin];
    
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:self
                                                                        attribute:NSLayoutAttributeHeight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeHeight
                                                                       multiplier:1.0f
                                                                         constant:self.frame.size.height];
    
    NSLayoutConstraint *centerYConstraint = [NSLayoutConstraint constraintWithItem:self
                                                                         attribute:NSLayoutAttributeCenterY
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:parentView
                                                                         attribute:NSLayoutAttributeCenterY
                                                                        multiplier:1.0f
                                                                          constant:0.0f];
    [parentView addConstraints:@[centerYConstraint,
                                 leftConstraint,
                                 rightConstraint,
                                 heightConstraint,
                                 ]];
    [parentView layoutSubtreeIfNeeded];
}

- (void)positionedInTopOfParentView:(NSView *)parentView
{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:self
                                                                        attribute:NSLayoutAttributeHeight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeHeight
                                                                       multiplier:1.0f
                                                                         constant:self.frame.size.height];
    
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self
                                                                     attribute:NSLayoutAttributeTop
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:parentView
                                                                     attribute:NSLayoutAttributeTop
                                                                    multiplier:1.0f
                                                                      constant:0.0f];
    
    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self
                                                                      attribute:NSLayoutAttributeLeft
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:parentView
                                                                      attribute:NSLayoutAttributeLeft
                                                                     multiplier:1.0f
                                                                       constant:0.0f];
    
    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:self
                                                                       attribute:NSLayoutAttributeRight
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:parentView
                                                                       attribute:NSLayoutAttributeRight
                                                                      multiplier:1.0f
                                                                        constant:0.0f];
    
    
    [parentView addConstraints:@[heightConstraint,
                                 topConstraint,
                                 leftConstraint,
                                 rightConstraint]];
    [parentView layoutSubtreeIfNeeded];
}

- (void)positionedInLeftOfParentView:(NSView *)parentView leftOffset:(CGFloat)offset topOffset:(CGFloat)topOffset
{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:self
                                                                       attribute:NSLayoutAttributeWidth
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:nil
                                                                       attribute:NSLayoutAttributeWidth
                                                                      multiplier:1.0f
                                                                        constant:self.frame.size.width];
    
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self
                                                                     attribute:NSLayoutAttributeTop
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:parentView
                                                                     attribute:NSLayoutAttributeTop
                                                                    multiplier:1.0f
                                                                      constant:topOffset];
    
    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self
                                                                      attribute:NSLayoutAttributeLeft
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:parentView
                                                                      attribute:NSLayoutAttributeLeft
                                                                     multiplier:1.0f
                                                                       constant:offset];
    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:self
                                                                        attribute:NSLayoutAttributeBottom
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:parentView
                                                                        attribute:NSLayoutAttributeBottom
                                                                       multiplier:1.0f
                                                                         constant:0.0f];
    
    [parentView addConstraints:@[widthConstraint,
                                 topConstraint,
                                 leftConstraint,
                                 bottomConstraint]];
    [parentView layoutSubtreeIfNeeded];
}

- (void)positionedInBottomOfParentView:(NSView *)parentView
{
    [self positionedInBottomOfParentView:parentView bottomOffset:0.0f];
}

- (void)positionedInBottomOfParentView:(NSView *)parentView bottomOffset:(CGFloat)offset
{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:self
                                                                        attribute:NSLayoutAttributeHeight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeHeight
                                                                       multiplier:1.0f
                                                                         constant:self.frame.size.height];
    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self
                                                                      attribute:NSLayoutAttributeLeft
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:parentView
                                                                      attribute:NSLayoutAttributeLeft
                                                                     multiplier:1.0f
                                                                       constant:0.0f];
    
    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:self
                                                                        attribute:NSLayoutAttributeBottom
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:parentView
                                                                        attribute:NSLayoutAttributeBottom
                                                                       multiplier:1.0f
                                                                         constant:offset];
    
    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:self
                                                                       attribute:NSLayoutAttributeRight
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:parentView
                                                                       attribute:NSLayoutAttributeRight
                                                                      multiplier:1.0f
                                                                        constant:0.0f];
    
    
    [parentView addConstraints:@[heightConstraint,
                                 leftConstraint,
                                 bottomConstraint,
                                 rightConstraint]];
    [parentView layoutSubtreeIfNeeded];
}

@end
