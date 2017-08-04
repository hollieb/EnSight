//
//  AndyFMDBTool.h
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import <Foundation/Foundation.h>
@class  AndyVideoListBaseModel;

@interface AndyFMDBTool : NSObject

+ (void)insertBySingle:(AndyVideoListBaseModel *)videoModel isFavorite:(BOOL)isFavorite success:(void(^)())success failure:(void(^)())failure;

+ (void)deleteBySingle:(AndyVideoListBaseModel *)videoModel isFavorite:(BOOL)isFavorite success:(void(^)())success failure:(void(^)())failure;

+ (NSMutableArray *)queryFavoriteCollection:(BOOL)isFavorite;

@end
