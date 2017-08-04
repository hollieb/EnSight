//
//  AndyPastDetailViewController.m
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import "AndyPastDetailViewController.h"
#import "AndySlideView.h"
#import "AndyPastTimeDetailTableViewController.h"
#import "AndyPastShareDetailTableViewController.h"
#import "MBProgressHUD+MJ.h"

@interface AndyPastDetailViewController ()

@end

@implementation AndyPastDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self setupSubViews];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [MBProgressHUD hideHUDForView:self.navigationController.view];
    
    [super viewWillDisappear:animated];
}

- (void)setupSubViews
{
    AndySlideView *sliderView = [[AndySlideView alloc] initWithFrame:self.view.bounds];
    sliderView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:sliderView];
    
    AndyPastTimeDetailTableViewController *ptdVC = [[AndyPastTimeDetailTableViewController alloc] init];
    ptdVC.pastDetailViewController = self;
    ptdVC.cartegoryTimeDetailUrl = self.categoryTimeDetailUrl;
    
    AndyPastShareDetailTableViewController *psdVC = [[AndyPastShareDetailTableViewController alloc] init];
    psdVC.pastDetailViewController = self;
    psdVC.categoryShareDetailUrl = self.categoryShareDetailUrl;
    
    NSArray *vcArray = [NSArray arrayWithObjects:ptdVC, psdVC, nil];
    NSArray *titleArray = [NSArray arrayWithObjects:@"Sort by time", @"Share the list", nil];
    
    [sliderView setupViewControllersArray:vcArray withTitleArray:titleArray];
}

- (void)dealloc
{
    AndyLog(@"The sort list page memory has been released");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
