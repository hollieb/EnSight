//
//  AndyDownloadTool.h
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AndyDownloadTool : NSObject

@property(nonatomic, strong) NSMutableArray *downloadArrayM;

+ (instancetype)sharedDownloadTool;

@end
