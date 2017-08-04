//
//  AndyVideoListBaseModel.h
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AndyProviderModel.h"
#import "AndyConsumptionModel.h"
#import "AndyDownloadCallBack.h"
#import "AndyVideoAlbumScrollCallBack.h"

typedef void (^AndyVideoListBaseModelEditOption)(BOOL isEdit);

typedef void (^AndyVideoListBaseModelDownloadOption)();

@interface AndyVideoListBaseModel : NSObject

@property(nonatomic, assign) NSInteger videoId;

@property (nonatomic, assign) long long date;

@property (nonatomic, copy) NSString *today;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *videoDescription;

@property (nonatomic, copy) NSString *category;

@property(nonatomic, strong) AndyProviderModel *provider;

@property (nonatomic, copy) NSString *videoDurtion;

@property (nonatomic, assign) long duration;

@property (nonatomic, copy) NSString *coverForFeed;

@property (nonatomic, copy) NSString *coverForDetail;

@property (nonatomic, copy) NSString *coverBlurred;

@property (nonatomic, copy) NSString *coverForSharing;

@property (nonatomic, copy) NSString *playUrl;

@property(nonatomic, strong) NSArray *playInfo;

@property (nonatomic, copy) NSString *webUrl;

@property (nonatomic, copy) NSString *rawWebUrl;

@property(nonatomic, strong) AndyConsumptionModel *consumption;

@property (nonatomic, assign) BOOL isAlreadyFavorite;

@property (nonatomic, assign) BOOL isAlreadyDownload;

@property (nonatomic, assign) BOOL isEditing;

@property (nonatomic, assign) BOOL isDownloading;

@property(nonatomic, copy) AndyVideoListBaseModelEditOption editOption;

@property(nonatomic, copy) AndyVideoListBaseModelDownloadOption downloadOption;

@property (nonatomic, strong) AndyDownloadCallBack *downloadCallBack;

@property(nonatomic, strong) AndyVideoAlbumScrollCallBack *videoAlbumScrollCallBack;

@end
