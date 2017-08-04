//
//  AndyVideoDetailTopImageCoverUIView.m
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import "AndyVideoDetailTopImageCoverUIView.h"
#import "AndyCommonVideoPlayViewController.h"
#import "AndyCommonVideoDetailViewController.h"
#import "AndyVideoPlayViewConteroller.h"
#import "AndyTabBarViewController.h"

@interface AndyVideoDetailTopImageCoverUIView ()<UIAlertViewDelegate>

@property (nonatomic, strong) UIView *coverView;

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, assign) int count;

@property (nonatomic, assign) BOOL isPressed;

@property (nonatomic, assign) BOOL isMoved;

@end

@implementation AndyVideoDetailTopImageCoverUIView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setupSubViews];
    }
    return self;
}

- (void)layoutSubviews
{
    self.coverView.frame = self.bounds;
    self.coverView.alpha = 0.0;
}

- (void)setupSubViews
{
    UIView *coverView = [[UIView alloc] init];
    coverView.backgroundColor = AndyColor(0, 0, 0, 0.3);
    coverView.alpha = 0.0;
    self.coverView = coverView;
    [self addSubview:self.coverView];
}

- (void)viewDidHolding
{
    [UIView animateWithDuration:0.2 animations:^{
        self.coverView.alpha = 1.0;
    }];
}

- (void)viewDidReleaseHolding
{
    [UIView animateWithDuration:0.2 animations:^{
        self.coverView.alpha = 0;
    }];
}

- (void)viewNeedNavigate
{
    if (self.videoModel.isAlreadyDownload)
    {
        [self decidePlayVideo];
    }
    else if ([AndyCommonFunction isNetworkConnected])
    {
        if ([AndyCommonFunction isWiFiEnabled])
        {
            [self decidePlayVideo];
        }
        else
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Hint" message:@"Currently on non-WiFi network, continuing will consume your data. Are you sure you want to play?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Continue", nil];
            [alertView show];
        }
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"The network is disconnected, please check your network connection." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [alertView show];
    }
}

- (void)decidePlayVideo
{
    BOOL isLocalExist = NO;
    NSURL *playNSURL = nil;
    NSString *playUrl = nil;
    if (self.videoModel.isAlreadyDownload)
    {
        playUrl = [AndyCommonFunction getVideoDownloadLocalPath:self.videoModel];
        NSFileManager *file_manager = [NSFileManager defaultManager];
        if ([file_manager fileExistsAtPath:playUrl])   //如果文件存在
        {
            AndyLog(@"File exists");
            isLocalExist = YES;
            playNSURL = [NSURL fileURLWithPath:playUrl];
        }
        else
        {
            playUrl = [AndyCommonFunction getOnLineVideoPlayUrl:self.videoModel];
            playNSURL = [NSURL URLWithString:[playUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        }
    }
    else
    {
        playUrl = [AndyCommonFunction getOnLineVideoPlayUrl:self.videoModel];
        playNSURL = [NSURL URLWithString:[playUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    }

    AndyVideoPlayViewConteroller *videoPlayVC = [[AndyVideoPlayViewConteroller alloc] init];
    videoPlayVC.playNSURL = playNSURL;
    videoPlayVC.videoTitle = self.videoModel.title;
    videoPlayVC.videoModel = self.videoModel;
    
    AndyCommonVideoDetailViewController *uivc = (AndyCommonVideoDetailViewController *)[AndyCommonFunction getCurrentPerformanceUIViewContorller];
    
//    AndyTabBarViewController *tabVC = (AndyTabBarViewController *)[UIApplication sharedApplication].windows.firstObject.rootViewController;
//    [tabVC roateLandscapeLeft];
//    
//    NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationLandscapeLeft];
//    [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
    
    [uivc.navigationController pushViewController:videoPlayVC animated:NO];
    //[uivc.navigationController presentViewController:videoPlayVC animated:NO completion:nil];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 1)
    {
        [self decidePlayVideo];
    }
}

//- (void)decidePlayVideo
//{
//    AndyCommonVideoPlayViewController *commonVideoPlayVC = [[AndyCommonVideoPlayViewController alloc] init];
//    commonVideoPlayVC.videoModel = self.videoModel;
//    //commonVideoPlayVC.playUrl = @"http://www.baidu.com/5.mp4";
//    
//    AndyCommonVideoDetailViewController *uivc = (AndyCommonVideoDetailViewController *)[AndyCommonFunction getCurrentPerformanceUIViewContorller];
//    uivc.commonVideoPlayerVC = commonVideoPlayVC;
//    
//    if (uivc != nil)
//    {
//        commonVideoPlayVC.delegate = uivc;
//        
//        [uivc presentViewController:commonVideoPlayVC animated:NO completion:nil];
//    }
//}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.count = 0;
    
    [self removeTimer];
    
    if (self.timer == nil)
    {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.005 target:self selector:@selector(countAutoIncrease) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    }
}

- (void)countAutoIncrease
{
    self.count++;
    
    if (self.count >= 1)
    {
        [self removeTimer];
        self.isPressed = true;
        
        AndyLog(@"begin %d", self.isPressed);
        
        [self viewDidHolding];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self removeTimer];
    
    self.isMoved = true;
    
    if (self.isPressed)
    {
        self.isPressed = false;
        
        AndyLog(@"move %d", self.isPressed);
        
        [self viewDidReleaseHolding];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self removeTimer];
    
    AndyLog(@"end %d", self.isPressed);
    
    if (self.isPressed)
    {
        self.isPressed = false;
        
        [self viewDidReleaseHolding];
    }
    
//    if (!self.isMoved)
//    {
        [self viewNeedNavigate];
//    }
    
    self.isMoved = false;
}

- (void)removeTimer
{
    [self.timer invalidate];
    self.timer = nil;
}


@end
