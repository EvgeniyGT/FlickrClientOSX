//
//  FLCTabBarViewController.m
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/10/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import "FLCTabBarViewController.h"
#import "FLCTabBarAnimator.h"

#import "NSViewController+Containment.h"
#import "NSView+Autolayout.h"
#import "NSColor+HexString.h"
#import <QuartzCore/QuartzCore.h>

@interface FLCTabBarViewController ()
@property (nonatomic, strong) FLCTabBarAnimator *animator;
@end

@implementation FLCTabBarViewController

#pragma mark - Accessors

- (FLCTabBarAnimator *)animator
{
    if (!_animator) {
        _animator = [[FLCTabBarAnimator alloc] init];
    }
    return _animator;
}

#pragma mark - Init

- (instancetype)init
{
    self = [super init];
    if (self) {
        _selectedIndex = 0;
    }
    return self;
}

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupAppearance];
}

#pragma mark - Setup

- (void)setupAppearance
{
    self.view.wantsLayer = YES;
    self.view.layer.backgroundColor = [NSColor colorWithHexString:@"5c5d69"].CGColor;
}

#pragma mark - Setters

- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    NSAssert(_selectedIndex < self.viewControllers.count, @"TabBarController wrong tab index");
    if (_selectedIndex == selectedIndex) return;
    
    NSViewController *toViewController = self.viewControllers[selectedIndex];
    NSViewController *fromViewController = self.selectedViewController;
    
    if (!toViewController.parentViewController) {
        [self showChildViewController:toViewController];
        [toViewController.view layoutToParentView:self.view];
    }
    
    weak_self weakSelf = self;
    [self.animator animateFromViewController:fromViewController
                            toViewController:toViewController
                                   direction:[self animationDirectionForNextIndex:selectedIndex]
                                inBoundaries:self.view.bounds completionBlock:^(BOOL finished) {
                                    [weakSelf hideChildViewController:fromViewController];
                                }];
    
    _selectedIndex = selectedIndex;
}

- (void)setViewControllers:(NSArray *)viewControllers
{
    NSAssert(viewControllers.count, @"TabBarController should have at least one VC");
    
    _viewControllers = viewControllers;
    
    [self showChildViewController:self.selectedViewController];
    [self.selectedViewController.view layoutToParentView:self.view];
}

- (NSViewController *)selectedViewController
{
    return self.viewControllers[self.selectedIndex];
}

#pragma mark - Helpers

- (FLCTabBarAnimationDirection)animationDirectionForNextIndex:(NSUInteger)nextIndex
{
    return nextIndex > _selectedIndex ? FLCTabBarAnimationFromDownToUp : FLCTabBarAnimationFromUpToDown;
}

@end
