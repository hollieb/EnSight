//
//  AndyDownloadTool.m
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import "AndyDownloadTool.h"
#import "AndyDownloadModel.h"

@implementation AndyDownloadTool

- (NSMutableArray *)downloadArrayM
{
    if (_downloadArrayM == nil)
    {
        _downloadArrayM = [NSMutableArray array];
    }
    return _downloadArrayM;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static AndyDownloadTool *instance;
    
    static dispatch_once_t oneToken;
    
    dispatch_once(&oneToken, ^{
        instance = [super allocWithZone:zone];
    });
    
    return instance;
}

+ (instancetype)sharedDownloadTool
{
    return [[self alloc] init];
}

@end
