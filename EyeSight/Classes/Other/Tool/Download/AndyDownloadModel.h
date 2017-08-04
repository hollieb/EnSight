//
//  AndyDownloadTool.h
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AndyDownloadModel : NSObject

@property (nonatomic, assign) NSInteger downloadId;

@property (nonatomic, copy) NSString *downloadUrl;

@property(nonatomic, strong) NSMutableArray *videoDownloadCallBackArrayM;

- (void)startDownload;

@end
