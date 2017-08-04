//
//  AndySlideView.m
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import "AndySlideView.h"
#import "AndySlideBar.h"
#import "AndyCommonTableViewController.h"
#import "AndySlideBar.h"
#import "AndyRankViewController.h"
#import "AndyCommonUIViewController.h"

#define AndySlideBarHeight 40

@interface AndySlideView ()<AndySlideBarDelegate, UIScrollViewDelegate>

@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, weak) AndySlideBar *slideBar;

@property (nonatomic, strong) NSArray *vcArray;

@end

@implementation AndySlideView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews
{
    AndySlideBar *slideBar = [[AndySlideBar alloc] initWithFrame:CGRectMake(0, 64, AndyMainScreenSize.width, AndySlideBarHeight)];
    slideBar.delegate = self;
    slideBar.backgroundColor = [UIColor clearColor];
    self.slideBar = slideBar;
    [self addSubview:self.slideBar];

    UIScrollView *scrollView = [[UIScrollView alloc] init];
    CGFloat scrollViewX = 0;
    CGFloat scrollViewY = 0;
    CGFloat scrollViewWidth = AndyMainScreenSize.width;
    CGFloat scrollViewHeight = AndyMainScreenSize.height - scrollViewY;
    scrollView.frame = CGRectMake(scrollViewX, scrollViewY, scrollViewWidth, scrollViewHeight);
    scrollView.delegate = self;
    
    scrollView.scrollsToTop = NO;
    self.scrollView = scrollView;
    [self addSubview:self.scrollView];
    
    [self bringSubviewToFront:self.slideBar];
}

- (void)setupViewControllersArray:(NSArray *)vcArr withTitleArray:(NSArray *)titleArr
{
    self.vcArray = vcArr;
    
    CGFloat childVCW = self.scrollView.frame.size.width;
    CGFloat childVCH = self.scrollView.frame.size.height;
    CGFloat childVCY = 0;
    
    for (int i = 0; i < vcArr.count; i++)
    {
        CGFloat childVCX = i *childVCW;
        
        AndyCommonTableViewController *commonTableViewVC = [vcArr objectAtIndex:i];
        commonTableViewVC.view.frame = CGRectMake(childVCX, childVCY, childVCW, childVCH);
        [self.scrollView addSubview:commonTableViewVC.view];
    }
    
    CGFloat contentW = vcArr.count * childVCW;
    self.scrollView.contentSize = CGSizeMake(contentW, 0);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.bounces = NO;
    
    self.slideBar.slideView = self;
    [self.slideBar setupSlideBarButtonsArray:titleArr];
}

- (void)slideBar:(AndySlideBar *)slideBar didSelectedButtonFrom:(long)from to:(long)to
{
    CGFloat contentOffsetX = to * self.scrollView.frame.size.width;
    CGPoint offset = CGPointMake(contentOffsetX, 0);
    [self.scrollView setContentOffset:offset animated:NO];
    
    [self loadDataAndCombineData:(int)to];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat scrollW = scrollView.frame.size.width;
    
    int pageNum = (scrollView.contentOffset.x + scrollW * 0.5) / scrollW;
    
    if ([self.delagate respondsToSelector:@selector(slideView:didScrollViewTo:)])
    {
        [self.delagate slideView:self didScrollViewTo:pageNum];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat scrollW = scrollView.frame.size.width;
    
    //int pageNum = (scrollView.contentOffset.x + scrollW * 0.5) / scrollW;
    int pageNum = scrollView.contentOffset.x / scrollW;
    
    if ([self.delagate respondsToSelector:@selector(slideView:didScrollViewTo:)])
    {
        [self.delagate slideView:self didScrollViewTo:pageNum];
    }
    
    [self loadDataAndCombineData:pageNum];
}

- (void)loadDataAndCombineData:(int)pageNum
{
    AndyCommonTableViewController *commonTableViewVC = self.vcArray[pageNum];

    for (int num = 0; num < self.vcArray.count; num++)
    {
        if (num != pageNum)
        {
            AndyCommonTableViewController *otherVC = self.vcArray[num];
            otherVC.tableView.scrollsToTop = NO;
        }
    }
    
    commonTableViewVC.tableView.scrollsToTop = YES;
    
    AndyCommonUIViewController *uivc = (AndyCommonUIViewController *)[AndyCommonFunction getCurrentPerformanceUIViewContorller];
    uivc.videoList = [commonTableViewVC.videoList copy];
    
    if (commonTableViewVC.videoList.count == 0)
    {
        [commonTableViewVC beginRefresh];
    }
}


















@end
