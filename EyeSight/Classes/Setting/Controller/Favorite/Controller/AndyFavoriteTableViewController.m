//
//  AndyFavoriteTableViewController.m
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import "AndyFavoriteTableViewController.h"
#import "AndyCommonVideoFrame.h"
#import "AndyFavoriteVideoCell.h"
#import "AndyVideoListBaseModel.h"
#import "AndyDailyTableViewController.h"
#import "AndyRankWeekTableViewController.h"
#import "AndyRankMonthTableViewController.h"
#import "AndyRankAllTableViewController.h"
#import "UIBarButtonItem+Andy.h"
#import "AndyDownloadModel.h"

@implementation AndyFavoriteTableViewController

- (NSMutableArray *)videoListFrame
{
    if (_videoListFrame == nil)
    {
        _videoListFrame = [NSMutableArray array];
    }
    return _videoListFrame;
}

- (void)dealloc
{
    AndyLog(@"The video list page memory has been released");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
    [self setupNavBar];
    
    [self combineData];
}

- (void)combineData
{
    self.videoList = XAppDelegate.favoriteVideoList;
    
    [self.videoList enumerateObjectsUsingBlock:^(AndyVideoListBaseModel *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        AndyCommonVideoFrame *videoFrame = [[AndyCommonVideoFrame alloc] init];
        obj.isEditing = NO;
        videoFrame.videoListBaseModel = obj;
        [self.videoListFrame addObject:videoFrame];
    }];
}

- (void)setupNavBar
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(navBarOperate)];
    
    //self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithButtonNormalTitle:@"编辑" selectedTitle:@"取消" target:self action:@selector(navBarOperate)];
}

- (void)navBarOperate
{
    if ([self.navigationItem.rightBarButtonItem.title isEqual:@"Edit"])
    {
        self.navigationItem.rightBarButtonItem.title = @"Cancel";
        
        [self changeCellState:YES];
    }
    else
    {
        self.navigationItem.rightBarButtonItem.title = @"Edit";
        
        [self changeCellState:NO];
    }
    
    //[self.tableView reloadData];
    
//    UIButton *button = self.navigationItem.rightBarButtonItem.customView;
//    if (button.selected)
//    {
//        button.selected = NO;
//    }
//    else
//    {
//        button.selected = YES;
//    }
}

- (void)changeCellState:(BOOL)isEditing
{
    [self.videoListFrame enumerateObjectsUsingBlock:^(AndyCommonVideoFrame *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.videoListBaseModel.isEditing = isEditing;
        if (obj.videoListBaseModel.editOption != nil)
        {
            obj.videoListBaseModel.editOption(isEditing);
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.videoListFrame.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AndyFavoriteVideoCell *cell = [AndyFavoriteVideoCell cellWithTableView:tableView];
    
    cell.commonVideoFrame = (AndyCommonVideoFrame *)self.videoListFrame[indexPath.row];
    
    return cell;      
}

//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (editingStyle == UITableViewCellEditingStyleDelete)
//    {
//            }
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //[tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return ((AndyCommonVideoFrame *)self.videoListFrame[indexPath.row]).cellHeight;
}


@end
