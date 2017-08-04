//
//  AndyVideoAlbumScrollCallBack.h
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AndyVideoAlbumScrollCallBack;

@protocol AndyVideoAlbumScrollCallBackDelegate <NSObject>

@optional
- (void)videoAlbumDidScroll;

@end


@interface AndyVideoAlbumScrollCallBack : NSObject

@property (nonatomic, weak) id<AndyVideoAlbumScrollCallBackDelegate> delagete;

@end
