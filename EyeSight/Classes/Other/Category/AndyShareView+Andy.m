//
//  AndyShareView+Andy.m
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import "AndyShareView+Andy.h"
#import "AndyShareView.h"
#import "AndyVideoListBaseModel.h"

@implementation AndyShareView (Andy)

+ (void)showShareViewWithVideoModel:(AndyVideoListBaseModel *)videoModel
{
    UIView *view = [[UIApplication sharedApplication].windows lastObject];

    if([view isKindOfClass:NSClassFromString(@"UIRemoteKeyboardWindow")])
    {
        unsigned long windowCounts = [UIApplication sharedApplication].windows.count;
        if (windowCounts >= 2)
        {
            view = [UIApplication sharedApplication].windows[1];
        }
    }
    
    [view setTransform:CGAffineTransformMakeRotation(0)];
    
    AndyShareView *shareView = [[AndyShareView alloc] initWithFrame:view.bounds];
    
    shareView.videoModel = videoModel;
    
    [view addSubview:shareView];
}

@end
