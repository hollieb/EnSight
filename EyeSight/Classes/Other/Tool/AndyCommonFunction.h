//
//  AndyCommonFunction.h
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class AndyVideoListBaseModel;

@interface AndyCommonFunction : NSObject

+ (BOOL)isNetworkConnected;

+ (BOOL)isWiFiEnabled;

+ (UIViewController *)getCurrentPerformanceUIViewContorller;

+ (NSString *)getOnLineVideoPlayUrl:(AndyVideoListBaseModel *)videoModel;

+ (NSString *)getVideoDownloadUrl:(AndyVideoListBaseModel *)videoModel;

+ (NSString *)getVideoDownloadLocalPath:(AndyVideoListBaseModel *)videoModel;

+ (NSString *)getVideoDownloadLocalFileName:(AndyVideoListBaseModel *)videoModel;

+ (BOOL)deleteDownloadVideo:(NSString *)downloadVideoLocalPath;

+ (NSString *)applicationDocumentsCacheDirectory;

+ (NSString *)applicationDocumentsFMDBDirectory;

+ (NSString *)getCacheFilePathWithFileName:(NSString *)fileName;

+ (NSString *)applicationDocumentsVideoDownloadDirectory;

+ (NSString *)getVideoDownloadFilePathWithFileName:(NSString *)fileName;

+ (NSString *)applicationDocumentsSplashScreenMobileImageDirectory;

+ (NSString *)getSplashScreenMobileImagePathWithFileName:(NSString *)fileName;

+ (NSString *)getSplashScreenMobileImageLocalPath;

+ (BOOL)checkFileIfExist:(NSString *)filePath;

+ (NSString *)computeMD5:(NSString *)str;

+ (NSString *)countCacheSize;

+ (unsigned long long int)getCacheFilesSize;

+ (NSMutableArray*)getCacheFilePath;

+ (void)clearCache;

+ (void)initUserDefaults;

@end
