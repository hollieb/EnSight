//
//  AndyCampaignViewController.m
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import "AndyCampaignViewController.h"
#import "MBProgressHUD+MJ.h"
#import "UIWebView+Clean.h"

@interface AndyCampaignViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation AndyCampaignViewController

- (void)loadView
{
    self.view = [[UIWebView alloc] init];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    UIWebView *webView = (UIWebView *)self.view;
    [webView cleanForDealloc];
    webView = nil;
    self.view = nil;
}

- (void)dealloc
{
    AndyLog(@"The page has been destroyed");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self setupNavBar];
    
    self.title = @"Topic";
    
    UIWebView *webView = (UIWebView *)self.view;
    webView.delegate = self;
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.url]];
    
    [webView loadRequest:request];
    
    //[webView.scrollView addSubview:nil];
    
    [MBProgressHUD showMessage:LoadingInfo toView:self.view];
}

- (void)setupNavBar
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(campaignBack)];
}

- (void)campaignBack
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)addTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(removeBottomBanner) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    //[[NSRunLoop currentRunLoop] addTimer:self.timer forMode:UITrackingRunLoopMode];
}

- (void)removeTimer
{
    [self.timer invalidate];
    self.timer = nil;
}

- (void)removeBottomBanner
{
//    NSString *js = @"var as = document.getElementsByTagName('div');for(i = 0;i < as.length;i++){if (as[i].id  == 'footer'){ as[i].style.display= 'none';} else if(as[i].className  == 'divider-h') {as[i].style.display= 'none';} else if(as[i].id  == 'download-area') {as[i].style.display= 'none';}}";
//    NSString *result = [(UIWebView *)self.view stringByEvaluatingJavaScriptFromString:js];
    
    NSString *js = @"var as = document.getElementsByTagName('div');for(i = 0;i < as.length;i++){if (as[i].id  == 'footer'){ as[i].style.display= 'none';break;}}";
    NSString *result = [(UIWebView *)self.view stringByEvaluatingJavaScriptFromString:js];
    
    NSString *js2 = @"var as = document.getElementsByTagName('div');for(i = 0;i < as.length;i++){if (as[i].className  == 'divider-h'){ as[i].style.display= 'none';break;}}";
    NSString *result2 = [(UIWebView *)self.view stringByEvaluatingJavaScriptFromString:js2];
    
    NSString *js3 = @"var as = document.getElementsByTagName('div');for(i = 0;i < as.length;i++){if (as[i].id  == 'download-area'){ as[i].style.display= 'none';break;}}";
    NSString *result3 = [(UIWebView *)self.view stringByEvaluatingJavaScriptFromString:js3];
    
    if ([result.lowercaseString isEqualToString:@"none"] && [result2.lowercaseString isEqualToString:@"none"] && [result3.lowercaseString isEqualToString:@"none"])
    {
        [self removeTimer];
        [MBProgressHUD hideHUDForView:self.view];
    }
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self removeTimer];
    [self addTimer];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self removeBottomBanner];
    
    [MBProgressHUD hideHUDForView:self.view];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    if([AndyCommonFunction isNetworkConnected])
    {
        [MBProgressHUD showError:LoadingError toView:self.view];
    }
    else
    {
        [MBProgressHUD showError:NetWorkOffline toView:self.view];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
