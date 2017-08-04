//
//  AndyVideoAlbumScrollTool.m
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import "AndyVideoAlbumScrollTool.h"

@implementation AndyVideoAlbumScrollTool

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static AndyVideoAlbumScrollTool *instance;
    
    static dispatch_once_t oneToken;
    
    dispatch_once(&oneToken, ^{
        instance = [super allocWithZone:zone];
    });
    
    return instance;
}

+ (instancetype)sharedVideoAlbumScrollTool
{
    return [[self alloc] init];
}

@end
