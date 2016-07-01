//
//  FLCMainViewController.m
//  FlickrClient
//
//  Created by Evgeniy Gurtovoy on 6/14/16.
//  Copyright © 2016 Evgeniy Gurtovoy. All rights reserved.
//

#import "FLCMainViewController.h"
#import "FLCTabBarButton.h"
#import "FLCTabBarContentViewControllersBuilder.h"
#import "NSStoryboardSegue+SegueDestination.h"

static NSString * const FLCDBName = @"FLCApplicationDB";

@interface FLCMainViewController ()

/* UI */
@property (weak, nonatomic) IBOutlet FLCTabBarButton *feedTabBarButton;
@property (weak, nonatomic) IBOutlet FLCTabBarButton *photostreamTabBarButton;
@property (weak, nonatomic) IBOutlet FLCTabBarButton *uploadTabBarButton;
@property (strong, nonatomic) NSArray *tabBarButtons;

/* TabBar */
@property (weak, nonatomic, readwrite) FLCTabBarViewController *tabBarViewController;

/* Builders */
@property (strong, nonatomic) FLCTabBarContentViewControllersBuilder *tabBarContentViewControllersBuilder;

/* CoreData stack */
@property (strong, nonatomic) HCDCoreDataStackController *coreDataController;

@end

@implementation FLCMainViewController

#pragma mark - Accessors

- (FLCTabBarContentViewControllersBuilder *)tabBarContentViewControllersBuilder
{
    if (!_tabBarContentViewControllersBuilder) {
        _tabBarContentViewControllersBuilder = [[FLCTabBarContentViewControllersBuilder alloc] initWitCoreDataController:self.coreDataController];
    }
    return _tabBarContentViewControllersBuilder;
}

- (HCDCoreDataStackController *)coreDataController
{
    if (!_coreDataController) {
        HCDCoreDataStack *stack = [HCDCoreDataStack sqliteStackWithName:FLCDBName];
        _coreDataController = [HCDCoreDataStackController controllerWithStack:stack];
    }
    return _coreDataController;
}

#pragma mark -

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    /* IBOutletCollection replication */
    self.tabBarButtons = @[self.feedTabBarButton,
                           self.photostreamTabBarButton,
                           self.uploadTabBarButton];
}

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - Reload UI

- (void)selectTabBarButton:(NSInteger)selectedIndex
{
    for (FLCTabBarButton *button in self.tabBarButtons) {
        button.selected = NO;
    }
    FLCTabBarButton *selectedButton = self.tabBarButtons[selectedIndex];
    selectedButton.selected = YES;
}

#pragma mark - Navigation

- (void)prepareForSegue:(NSStoryboardSegue *)segue sender:(id)sender
{
    if ([segue isSegueToClass:[FLCTabBarViewController class]]) {
        self.tabBarViewController = segue.destinationController;
        [self setupTabBarController];
        [self selectTabBarButton:self.tabBarViewController.selectedIndex];
    }
}

#pragma mark - Setup TabBarController Content

- (void)setupTabBarController
{
    NSArray *tabBarViewControllers = [self.tabBarContentViewControllersBuilder contentViewControllers];
    [self.tabBarViewController setViewControllers:tabBarViewControllers];
}

#pragma mark - Actions

- (IBAction)tabBarButtonClicked:(FLCTabBarButton *)selectedButton
{
    self.tabBarViewController.selectedIndex = selectedButton.tag;
    [self selectTabBarButton:selectedButton.tag];
}

@end
