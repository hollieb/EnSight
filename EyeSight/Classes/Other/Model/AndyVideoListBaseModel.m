//
//  AndyVideoListBaseModel.m
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import "AndyVideoListBaseModel.h"
#import "MJExtension.h"
#import "AndyPlayInfoModel.h"
#import "AndyVideoAlbumScrollCallBack.h"

@implementation AndyVideoListBaseModel

- (NSDictionary *)objectClassInArray
{
    return @{@"playInfo" : [AndyPlayInfoModel class]};
}

- (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"videoId" : @"id", @"videoDescription" : @"description"};
}

- (NSString *)videoDurtion
{
    NSString *minute = [NSString stringWithFormat:@"%02ld", self.duration / 60] ;
    NSString *second = [NSString stringWithFormat:@"%02ld", self.duration % 60] ;
    
    return [NSString stringWithFormat:@"%@'%@''", minute, second];
}

- (AndyDownloadCallBack *)downloadCallBack
{
    if (_downloadCallBack == nil)
    {
        _downloadCallBack = [[AndyDownloadCallBack alloc] init];
    }
    return _downloadCallBack;
}

- (AndyVideoAlbumScrollCallBack *)videoAlbumScrollCallBack
{
    if (_videoAlbumScrollCallBack == nil)
    {
        _videoAlbumScrollCallBack = [[AndyVideoAlbumScrollCallBack alloc] init];
    }
    return _videoAlbumScrollCallBack;
        
}

@end
