//
//  AndyCateogryModel.m
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import "AndyCateogryModel.h"
#import "MJExtension.h"
#import "AndyVideoAlbumScrollCallBack.h"

@implementation AndyCateogryModel

-(NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"cateogryId" : @"id"};
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
