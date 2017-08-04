//
//  AndyCommonVideoDetailViewController.h
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AndyCommonVideoPlayViewController.h"
#import <MessageUI/MessageUI.h>

@class AndyVideoListBaseModel;

@interface AndyCommonVideoDetailViewController : UIViewController<AndyCommonVideoPlayViewControllerDelegate, MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *videoList;

@property (nonatomic, strong) AndyVideoListBaseModel *currentVideoModel;

@property (nonatomic, strong) AndyCommonVideoPlayViewController *commonVideoPlayerVC;

@end
