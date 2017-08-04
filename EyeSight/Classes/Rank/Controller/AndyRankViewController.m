//
//  AndyRankViewController.m
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import "AndyRankViewController.h"
#import "AndyRankWeekTableViewController.h"
#import "AndyRankMonthTableViewController.h"
#import "AndyRankAllTableViewController.h"
#import "AndySlideView.h"

@interface AndyRankViewController ()

@property (nonatomic, weak) AndySlideView *slideView;

@end

@implementation AndyRankViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self setupSubViews];
}

- (void)setupSubViews
{
    AndySlideView *slideView = [[AndySlideView alloc] initWithFrame:self.view.bounds];
    slideView.backgroundColor = [UIColor whiteColor];
    self.slideView = slideView;
    [self.view addSubview:self.slideView];
    
    AndyRankWeekTableViewController *weekVC = [[AndyRankWeekTableViewController alloc] init];
    XAppDelegate.rankWeekTableViewController = weekVC;
    AndyRankMonthTableViewController *monthVC = [[AndyRankMonthTableViewController alloc] init];
    XAppDelegate.rankMonthTableViewController = monthVC;
    AndyRankAllTableViewController *allVC = [[AndyRankAllTableViewController alloc] init];
    XAppDelegate.rankAllTableViewController = allVC;
    
    NSArray *vcArray = [NSArray arrayWithObjects:weekVC, monthVC, allVC, nil];
    NSArray *titleArray = [NSArray arrayWithObjects:@"Weekly", @"Monthly", @"Total Ranking", nil];
    
    [self.slideView setupViewControllersArray:vcArray withTitleArray:titleArray];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
