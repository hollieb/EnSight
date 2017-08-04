//
//  AndyAboutTableViewController.m
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import "AndyAboutTableViewController.h"
#import "AndySettingAlertArrowItem.h"
#import "AndySettingLabelItem.h"
#import "AndySettingGroup.h"
#import "UIBarButtonItem+Andy.h"
#import "AndyShareView+Andy.h"
#import "MBProgressHUD+MJ.h"

#define AndyAppNameLabelFont [UIFont systemFontOfSize:20]

@implementation AndyAboutTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupSubViews];
    
    [self setupGroup];
    
    [self setupNavBar];
}

- (void)setupNavBar
{
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithIcon:@"shareApp" highIcon:@"shareApp_HighLighted" target:self action:@selector(shareClick:)];
    
    //self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithButtonNormalTitle:@"Edit" selectedTitle:@"Cancel" target:self action:@selector(navBarOperate)];
}

- (void)shareClick:(UIBarButtonItem *)barButtonItem
{
    [AndyShareView showShareViewWithVideoModel:nil];
}

- (void)setupSubViews
{
    UIView *headerView = [[UIView alloc] init];
    
    headerView.bounds = (CGRect){CGPointZero, {AndyMainScreenSize.width, AndyMainScreenSize.width * 1 / 2}};
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"about_logo"]];
    CGFloat imageViewW = 70;
    CGFloat imageViewH = imageViewW;
    CGFloat imageViewX = (headerView.frame.size.width - imageViewW) / 2;
    CGFloat imageViewY = headerView.frame.size.height * 0.23;
    imageView.frame = CGRectMake(imageViewX, imageViewY, imageViewW, imageViewH);
    [headerView addSubview:imageView];
    
    UILabel *appNameLabel = [[UILabel alloc] init];
    appNameLabel.text = @"Windows";
    appNameLabel.font = AndyAppNameLabelFont;
    appNameLabel.textColor = [UIColor blackColor];
    NSMutableDictionary *appNameLabelMD = [NSMutableDictionary dictionary];
    appNameLabelMD[NSFontAttributeName] = AndyAppNameLabelFont;
    CGSize appNameLabelSize = [appNameLabel.text sizeWithAttributes:appNameLabelMD];
    CGFloat appNameLabelX = (headerView.frame.size.width - appNameLabelSize.width) / 2;
    CGFloat appNameLabelY = CGRectGetMaxY(imageView.frame) + 25;
    appNameLabel.frame = (CGRect){{appNameLabelX, appNameLabelY}, appNameLabelSize};
    [headerView addSubview:appNameLabel];
    
    CGFloat headerViewH = AndyMainScreenSize.width * 1 / 2;
    
    if (headerViewH < CGRectGetMaxY(appNameLabel.frame) + 25)
    {
        headerViewH = CGRectGetMaxY(appNameLabel.frame) + 25;
    }
    
    headerView.bounds = (CGRect){CGPointZero, {AndyMainScreenSize.width, headerViewH}};
    
    self.tableView.tableHeaderView = headerView;
}

- (void)setupGroup
{
    AndySettingItem *versionItem = [AndySettingLabelItem itemWithTitle:@"Version" labelInfo:@"1.0.6"];
    
    AndySettingItem *authorItem = [AndySettingLabelItem itemWithTitle:@"Author" labelInfo:@"Hollie.Bradley"];
    
    AndySettingItem *QQGroupItem = [AndySettingAlertArrowItem itemWithTitle:@"Windows user exchange group" labelInfo:@"513068538"];
    QQGroupItem.option = ^{
        
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        pasteboard.string = @"513068538";
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Prompt" message:@"Group number copied:513068538" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        
        [alertView show];
    };
    
    AndySettingGroup *group = [[AndySettingGroup alloc] init];
    group.items = @[versionItem, authorItem, QQGroupItem];
    [self.data addObject:group];
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    [controller dismissViewControllerAnimated:YES completion:^{
        if (result == MessageComposeResultSent)
        {
            [MBProgressHUD showSuccess:@"Success"];
        }
        else if (result == MessageComposeResultFailed)
        {
            //[MBProgressHUD showError:@"Failed"];
        }
    }];
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [controller dismissViewControllerAnimated:YES completion:^{
        if(error == nil)
        {
            if (result == MFMailComposeResultSent)
            {
                [MBProgressHUD showSuccess:@"Success"];
            }
            else if (result == MFMailComposeResultFailed)
            {
                //[MBProgressHUD showError:@"Failed"];
            }
        }
        else
        {
            //[MBProgressHUD showError:@"Error"];
        }
    }];
    
}


@end
