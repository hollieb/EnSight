//
//  AndyTabBarViewController.m
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import "AndyTabBarViewController.h"
#import "AndyTabBar.h"
#import "AndyDailyTableViewController.h"
#import "AndyPastCategoryCollectionViewController.h"
#import "AndyRankViewController.h"
#import "AndySettingTableViewController.h"
#import "AndyNavigationController.h"
#import "AndySettingTableViewController.h"

@interface AndyTabBarViewController () <AndyTabBarDelegate>

@property (nonatomic, weak) AndyTabBar *customTabBar;

@property(nonatomic, strong) AndyDailyTableViewController *daily;
@property(nonatomic, strong) AndyPastCategoryCollectionViewController *past;
@property(nonatomic, strong) AndyRankViewController *rank;
@property(nonatomic, strong) AndySettingTableViewController *setting;

@property(nonatomic) UIInterfaceOrientationMask orietation;

@end

@implementation AndyTabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //[self setupTabBar];
    
    self.tabBar.tintColor = AndyColor(69, 142, 249, 1.0);
    
    [self setupAllChildViewControllers];
}

-(void)roateLandscapeLeft
{
    NSNumber *value = [NSNumber numberWithInt:UIDeviceOrientationLandscapeLeft];
    [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
    
    self.orietation = UIInterfaceOrientationMaskLandscapeLeft;
}

-(void)roatePortrait
{
    
    NSNumber *value = [NSNumber numberWithInt:UIDeviceOrientationPortrait];
    [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
    
    self.orietation = UIInterfaceOrientationMaskPortrait;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
//    NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
//    [[UIDevice currentDevice] setValue:value forKey:@"orientation"];

    
//    for (UIView *child in self.tabBar.subviews)
//    {
//        if ([child isKindOfClass:[UIControl class]])
//        {
//            [child removeFromSuperview];
//        }
//    }
    
    [self roatePortrait];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return self.orietation;
}

- (void)tabBar:(AndyTabBar *)tabBar didSelectedButtonFrom:(int)from to:(int)to
{
    self.selectedIndex = to;
    if (to == 0)
    {
        //self.daily refr
    }
}

- (void)setupTabBar
{
    AndyTabBar *customTabBar = [[AndyTabBar alloc] init];
    customTabBar.frame = self.tabBar.bounds;
    customTabBar.delegate = self;
    [self.tabBar addSubview:customTabBar];
    self.customTabBar = customTabBar;
}

- (void)setupAllChildViewControllers
{
    AndyDailyTableViewController *daily = [[AndyDailyTableViewController alloc] init];
    [self setupChildViewController:daily title:@"Featured" imageName:@"tabbar_daily" selectedImageName:@"tabbar_daily_selected"];
    self.daily = daily;
    XAppDelegate.dailyTableViewController = self.daily;
    
    AndyPastCategoryCollectionViewController *past = [[AndyPastCategoryCollectionViewController alloc] init];
    [self setupChildViewController:past title:@"Category" imageName:@"tabbar_past" selectedImageName:@"tabbar_past_selected"];
    self.past = past;
    
    AndyRankViewController *rank = [[AndyRankViewController alloc] init];
    [self setupChildViewController:rank title:@"Ranking" imageName:@"tabbar_rank" selectedImageName:@"tabbar_rank_selected"];
    self.rank = rank;
    XAppDelegate.rankViewController = rank;
    
    AndySettingTableViewController *setting= [[AndySettingTableViewController alloc] init];
    [self setupChildViewController:setting title:@"Set up" imageName:@"tabbar_setting" selectedImageName:@"tabbar_setting_selected"];
    self.setting = setting;
}

- (void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    childVc.title = title;
    
    UIImage *image = [UIImage imageNamed:imageName];
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    
    //image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    childVc.tabBarItem.image = image;
    
    childVc.tabBarItem.selectedImage = selectedImage;
    
    AndyNavigationController *nav = [[AndyNavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
    
    //[self.customTabBar addTabBarButtonWithItem:childVc.tabBarItem];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
