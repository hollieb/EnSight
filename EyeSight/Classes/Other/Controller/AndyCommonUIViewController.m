//
//  AndyCommonUIViewController.m
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import "AndyCommonUIViewController.h"

@implementation AndyCommonUIViewController

- (NSMutableArray *)videoList
{
    if (_videoList == nil)
    {
        _videoList = [NSMutableArray array];
    }
    return _videoList;
}

@end
