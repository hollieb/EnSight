//
//  AndyHttpTool.h
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AndyHttpTool : NSObject

/**
 *  POST
 *
 *  @param url
 *  @param params
 *  @param success
 *  @param failure
 */
+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

/**
 *  POST)
 *
 *  @param url
 *  @param params
 *  @param formData
 *  @param success
 *  @param failure
 */
+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params formDataArray:(NSArray *)formDataArray success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

/**
 *  GET
 *
 *  @param url
 *  @param params
 *  @param success
 *  @param failure 
 */
+ (void)getWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

+ (void)downloadWithURL:(NSString *)url fileName:(NSString *)fileName localPath:(NSString *)localPath progress:(void (^)(double p))progress success:(void (^)())success failure:(void (^)())failure;


@end
