//
//  AndyDownloadCallBack.h
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AndyDownloadCallBack;

@protocol AndyDownloadCallBackDelegate <NSObject>

@optional
- (void)downloadProgress:(unsigned long)value downloadId:(NSInteger)downloadId;

- (void)downloadCompleteWithDownloadId:(NSInteger)downloadId;

- (void)downloadErrorWithDownloadId:(NSInteger)downloadId;

@end

@interface AndyDownloadCallBack : NSObject

@property (nonatomic, weak) id<AndyDownloadCallBackDelegate> delegate;

@end
