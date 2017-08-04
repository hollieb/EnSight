//
//  AndyFavoriteVideoCell.m
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import "AndyFavoriteVideoCell.h"
#import "AndyCommonVideoFrame.h"
#import "AndyVideoListBaseModel.h"
#import "UIImageView+WebCache.h"
#import "AndyTabBarViewController.h"
#import "AndyDailyTableViewController.h"
#import "AndyNavigationController.h"
#import "AndyFavoriteVideoDetailViewController.h"
#import "AndyFavoriteTableViewController.h"
#import "AndyDownloadTableViewController.h"
#import "AndyVideoAlbumScrollTool.h"

@interface AndyFavoriteVideoCell ()<AndyVideoAlbumScrollCallBackDelegate>

@property (nonatomic, weak) UIImageView *bgView;

@property (nonatomic, weak) UIView *coverView;

@property (nonatomic, weak) UILabel *titleLabel;

@property (nonatomic, weak) UILabel *categoryAndDurationLabel;

@property (nonatomic, weak) UIButton *editButton;

@end

@implementation AndyFavoriteVideoCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *Id = @"videoFavoriteCell";
    AndyFavoriteVideoCell *cell = [tableView dequeueReusableCellWithIdentifier:Id];
    if (cell == nil)
    {
        cell = [[AndyFavoriteVideoCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:Id];
    }
    cell.bgView.alpha = 0.0;
    cell.coverView.alpha = 1.0;

    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.delegate = self;
        
        [self setupSubViews];
    }
    return self;
}

- (void)cellViewDidHolding:(AndyCommonVideoBaseCell *)andyCommonVideoBaseCell
{
    if (self.commonVideoFrame.videoListBaseModel.isEditing == NO)
    {
        [UIView animateWithDuration:0.2 animations:^{
            self.coverView.alpha = 0;
        }];
    }
    else
    {
        self.coverView.alpha = 1.0;
    }
}

- (void)cellViewDidReleaseHolding:(AndyCommonVideoBaseCell *)andyCommonVideoBaseCell
{
    if (self.commonVideoFrame.videoListBaseModel.isEditing == NO)
    {
        [UIView animateWithDuration:0.2 animations:^{
            self.coverView.alpha = 1;
        } completion:^(BOOL finished) {
            
            AndyVideoAlbumScrollTool *videoAlbumScrollTool = [AndyVideoAlbumScrollTool sharedVideoAlbumScrollTool];
            
            videoAlbumScrollTool.videoAlbumScrollCallBack = self.commonVideoFrame.videoListBaseModel.videoAlbumScrollCallBack;
            
        }];
    }
    else
    {
        self.coverView.alpha = 1.0;
    }
}

- (void)cellViewNeedNavigate:(AndyCommonVideoBaseCell *)andyCommonVideoBaseCell
{
    if (self.commonVideoFrame.videoListBaseModel.isEditing == NO)
    {
        AndyLog(@"I'm going to jump");
        
        AndyFavoriteVideoDetailViewController *commonVideoDetailVC = [[AndyFavoriteVideoDetailViewController alloc] init];
        commonVideoDetailVC.title = @"Details";
        commonVideoDetailVC.view.backgroundColor = [UIColor whiteColor];
        
        AndyCommonTableViewController *uivc = (AndyCommonTableViewController *)[AndyCommonFunction getCurrentPerformanceUIViewContorller];
        
        
        commonVideoDetailVC.videoList = uivc.videoList;
        
        commonVideoDetailVC.currentVideoModel = self.commonVideoFrame.videoListBaseModel;
        
        if (uivc != nil)
        {
            [uivc.navigationController pushViewController:commonVideoDetailVC animated:YES];
        }
    }
    else
    {
        self.coverView.alpha = 1.0;
    }
}

- (void)setupSubViews
{
    UIImageView *bgView = [[UIImageView alloc] init];
    [self.contentView addSubview:bgView];
    bgView.alpha = 0.0;
    self.bgView = bgView;
    
    UIView *coverView = [[UIView alloc] init];
    coverView.backgroundColor = AndyColor(0, 0, 0, 0.3);
    [self.contentView addSubview:coverView];
    self.coverView = coverView;
    
    UILabel *titleLabel = [[UILabel alloc] init];
    [self.coverView addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    UILabel *categoryAndDurationLabel = [[UILabel alloc] init];
    [self.coverView addSubview:categoryAndDurationLabel];
    self.categoryAndDurationLabel = categoryAndDurationLabel;
    
    UIButton *editButton = [[UIButton alloc] init];
    [editButton setBackgroundImage:[UIImage imageNamed:@"delete"] forState:UIControlStateNormal];
    editButton.alpha = 0.0;
    self.editButton = editButton;
    [self.contentView addSubview:self.editButton];
}

- (void)videoAlbumDidScroll
{
    self.coverView.alpha = 1.0;
    
    AndyLog(@"The collection was also called up by the call");
}

- (void)setCommonVideoFrame:(AndyCommonVideoFrame *)commonVideoFrame
{
    _commonVideoFrame = commonVideoFrame;
    
    AndyVideoListBaseModel *videoListBaseModel = self.commonVideoFrame.videoListBaseModel;
    
    self.commonVideoFrame.videoListBaseModel.videoAlbumScrollCallBack.delagete = self;
    
    [self.bgView setImageWithURL:[NSURL URLWithString:videoListBaseModel.coverForDetail] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
        [UIView animateWithDuration:0.3 animations:^{
            self.bgView.alpha = 1.0;
        }];
    }];
    
    //[self.bgView setImageWithURL:[NSURL URLWithString:videoListBaseModel.coverForDetail] placeholderImage:nil];
    self.bgView.frame = self.commonVideoFrame.bgViewF;
    
    self.coverView.frame = self.commonVideoFrame.coverViewF;
    
    self.titleLabel.text = videoListBaseModel.title;
    [self.titleLabel setTextColor:[UIColor whiteColor]];
    self.titleLabel.font = AndyVideoListBaseModelTitleFont;
    self.titleLabel.frame = self.commonVideoFrame.titleLabelF;
    
    self.categoryAndDurationLabel.text = [NSString stringWithFormat:@"#%@  /  %@", videoListBaseModel.category, videoListBaseModel.videoDurtion];
    [self.categoryAndDurationLabel setTextColor:[UIColor whiteColor]];
    self.categoryAndDurationLabel.font = AndyVideoListBaseModelCategoryAndDurationFont;
    self.categoryAndDurationLabel.frame = self.commonVideoFrame.categoryAndDurationLabelF;
    
    CGSize editButtonSize = self.editButton.currentBackgroundImage.size;
    CGFloat editBUttonX = (AndyMainScreenSize.width - editButtonSize.width) / 2;
    CGFloat editButtonY = self.commonVideoFrame.cellHeight - 60;
    self.editButton.frame = (CGRect){{editBUttonX, editButtonY}, {editButtonSize.width * 1.4, editButtonSize.height * 1.4}};
    
        if (videoListBaseModel.isEditing)
    {
        self.editButton.alpha = 1.0;
        [self.editButton addTarget:self action:@selector(removeItemAndCell) forControlEvents:UIControlEventTouchUpInside];
    }
    else
    {
        self.editButton.alpha = 0.0;
        [self.editButton removeTarget:self action:@selector(removeItemAndCell) forControlEvents:UIControlEventTouchUpInside];
    }
    
    videoListBaseModel.editOption = ^(BOOL isEdit)
    {
        if (isEdit == YES)
        {
            self.editButton.alpha = 1.0;
            [self.editButton addTarget:self action:@selector(removeItemAndCell) forControlEvents:UIControlEventTouchUpInside];
        }
        else
        {
            self.editButton.alpha = 0.0;
            [self.editButton removeTarget:self action:@selector(removeItemAndCell) forControlEvents:UIControlEventTouchUpInside];
        }
    };
}

- (void)removeItemAndCell
{
    AndyVideoListBaseModel *videoModel = self.commonVideoFrame.videoListBaseModel;
    
    [AndyFMDBTool deleteBySingle:videoModel isFavorite:YES  success:^{

        AndyFavoriteTableViewController *favoriteVc = (AndyFavoriteTableViewController *)[AndyCommonFunction getCurrentPerformanceUIViewContorller];
        
        AndyLog(@"%lu", (unsigned long)favoriteVc.videoListFrame.count);
        
        NSInteger favoriteIndex = [favoriteVc.videoListFrame indexOfObject:self.commonVideoFrame];
        NSIndexPath *favoriteIndexPath = [NSIndexPath indexPathForRow:favoriteIndex inSection:0];
        
        [favoriteVc.videoListFrame removeObjectAtIndex:favoriteIndex];
        [favoriteVc.tableView deleteRowsAtIndexPaths:@[favoriteIndexPath] withRowAnimation:UITableViewRowAnimationTop];
        
        AndyLog(@"%lu", (unsigned long)favoriteVc.videoListFrame.count);
        
        [favoriteVc.videoList removeObjectAtIndex:favoriteIndex];

        [XAppDelegate.downloadVideoList enumerateObjectsUsingBlock:^(AndyVideoListBaseModel *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if (obj.videoId == videoModel.videoId)
                {
                    obj.isAlreadyFavorite = NO;
                }
        }];
        
        [XAppDelegate.dailyTableViewController.videoList enumerateObjectsUsingBlock:^(AndyVideoListBaseModel *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj.videoId == videoModel.videoId)
            {
                obj.isAlreadyFavorite = NO;
            }
        }];
        
        [XAppDelegate.rankWeekTableViewController.videoList enumerateObjectsUsingBlock:^(AndyVideoListBaseModel *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj.videoId == videoModel.videoId)
            {
                obj.isAlreadyFavorite = NO;
            }
        }];
        
        
        [XAppDelegate.rankMonthTableViewController.videoList enumerateObjectsUsingBlock:^(AndyVideoListBaseModel *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj.videoId == videoModel.videoId)
            {
                obj.isAlreadyFavorite = NO;
            }
        }];
        
        [XAppDelegate.rankAllTableViewController.videoList enumerateObjectsUsingBlock:^(AndyVideoListBaseModel *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj.videoId == videoModel.videoId)
            {
                obj.isAlreadyFavorite = NO;
            }
        }];
        
    } failure:^{
        
    }];
    
}


@end
