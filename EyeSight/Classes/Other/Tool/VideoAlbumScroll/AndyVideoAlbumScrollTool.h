//
//  AndyVideoAlbumScrollTool.h
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AndyVideoAlbumScrollCallBack;

@interface AndyVideoAlbumScrollTool : NSObject

@property (nonatomic, strong) AndyVideoAlbumScrollCallBack *videoAlbumScrollCallBack;

+ (instancetype)sharedVideoAlbumScrollTool;

@end
