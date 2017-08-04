//
//  AndyCommonTableViewController.m
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import "AndyCommonTableViewController.h"
#import "AndyVideoAlbumScrollTool.h"
#import "AndyVideoAlbumScrollCallBack.h"

@implementation AndyCommonTableViewController

- (NSMutableArray *)videoList
{
    if (_videoList == nil)
    {
        _videoList = [NSMutableArray array];
    }
    return _videoList;
}

- (void)beginRefresh
{
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    AndyVideoAlbumScrollTool *videoAlbumScrollTool = [AndyVideoAlbumScrollTool sharedVideoAlbumScrollTool];

    if ([videoAlbumScrollTool.videoAlbumScrollCallBack.delagete respondsToSelector:@selector(videoAlbumDidScroll)])
    {
        [videoAlbumScrollTool.videoAlbumScrollCallBack.delagete videoAlbumDidScroll];
    }
    
    //videoAlbumScrollTool.videoAlbumScrollCallBack = nil;
}

@end
