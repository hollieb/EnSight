//
//  AndyWelcomeView+Andy.m
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import "AndyWelcomeView+Andy.h"
#import "AndyWelcomeView.h"

@implementation AndyWelcomeView (Andy)

 + (void)showWelcomeViewWithImageData:(NSData *)imageData
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
    
    AndyWelcomeView *welcomeView = [[AndyWelcomeView alloc] initWithFrame:view.bounds];
    
    welcomeView.imageData = imageData;
    
    [view addSubview:welcomeView];
}

@end
