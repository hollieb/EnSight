//
//  AndySettingTableViewController.m
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import "AndySettingTableViewController.h"
#import "AndySettingGroup.h"
#import "AndySettingItem.h"
#import "AndySettingLabelItem.h"
#import "AndySettingSwitchItem.h"
#import "AndySettingArrowItem.h"
#import "AndyAboutTableViewController.h"
#import "AndyFavoriteTableViewController.h"
#import "AndyDownloadTableViewController.h"
#import "AndySettingCacheArrowItem.h"

@implementation AndySettingTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Settings";
    
    [self setupGroup0];
    [self setupGroup1];
    [self setupGroup2];
    [self setupGroup3];
    
    //[self.tableView reloadData];
}

- (void)setupGroup0
{
    AndySettingItem *favorite = [AndySettingArrowItem itemWithTitle:@"My collection" destVcClass:[AndyFavoriteTableViewController class]];
    AndySettingItem *download = [AndySettingArrowItem itemWithTitle:@"My downloads" destVcClass:[AndyDownloadTableViewController class]];
    
    AndySettingGroup *group = [[AndySettingGroup alloc] init];
    group.items = @[favorite, download];
    [self.data addObject:group];
}

- (void)setupGroup1
{
    AndySettingItem *wifiPlayHighQualitySwitch = [AndySettingSwitchItem itemWithTitle:@"WiFi Automatically play HD" forKey:SettingWiFiKey forDefaultValue:YES];
    AndySettingItem *videoAutoBackSwitch = [AndySettingSwitchItem itemWithTitle:@"Autoplay" forKey:SettingIsVideoAutoBack forDefaultValue:YES];
    //AndySettingItem *wifiIsPlaySwitch = [AndySettingSwitchItem itemWithTitle:@"允许非WiFi网络播放视频" forKey:SettingWiFiIsPlayKey forDefaultValue:NO];
    AndySettingItem *downloadSwitch = [AndySettingSwitchItem itemWithTitle:@"Video download automatically selects HD" forKey:SettingDownloadKey forDefaultValue:YES];
    AndySettingItem *favoriteSwitch = [AndySettingSwitchItem itemWithTitle:@"Favorite video automatically download" forKey:SettingFavoriteKey forDefaultValue:NO];
    AndySettingItem *doubleTapSwitch = [AndySettingSwitchItem itemWithTitle:@"Double-click the video to return to the list" forKey:SettingDoubleTapKey forDefaultValue:NO];

    AndySettingGroup *group = [[AndySettingGroup alloc] init];
    group.items = @[wifiPlayHighQualitySwitch, videoAutoBackSwitch, downloadSwitch, favoriteSwitch, doubleTapSwitch];
    [self.data addObject:group];
}

- (void)setupGroup2
{
    AndySettingItem *clearCache = [AndySettingCacheArrowItem itemWithTitle:@"Clean up cache" subTitle:@"Will not clean collection and downloads"];
    
    AndySettingGroup *group = [[AndySettingGroup alloc] init];
    group.items = @[clearCache];
    [self.data addObject:group];
}

- (void)setupGroup3
{
    AndySettingItem *mark = [AndySettingArrowItem itemWithTitle:@"Five Stars"];
    mark.option = ^{
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=1059327510"]];
    };
    
    AndySettingItem *about = [AndySettingArrowItem itemWithTitle:@"About" destVcClass:[AndyAboutTableViewController class]];
    
    AndySettingGroup *group = [[AndySettingGroup alloc] init];
    group.items = @[mark, about];
    [self.data addObject:group];
}

@end
