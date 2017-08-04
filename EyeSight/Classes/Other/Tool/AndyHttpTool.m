//
//  AndyHttpTool.m
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AndyHttpTool.h"
#import "AFNetworking.h"

@implementation AndyHttpTool

+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    
    [mgr POST:url parameters:params
      success:^(AFHTTPRequestOperation *operation, id responseObject) {
          if (success) {
              success(responseObject);
          }
      } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
          if (failure) {
              failure(error);
          }
      }];
}

+ (void)getWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    
    [mgr GET:url parameters:params
     success:^(AFHTTPRequestOperation *operation, id responseObject) {
         if (success) {
             success(responseObject);
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         if (failure) {
             failure(error);
         }
     }];
}

+ (void)downloadWithURL:(NSString *)url fileName:(NSString *)fileName localPath:(NSString *)localPath progress:(void (^)(double))progress success:(void (^)())success failure:(void (^)())failure
{
    
    NSOperationQueue *queue = [[NSOperationQueue alloc ]init];
    
    NSURL *downloadUrl = [NSURL URLWithString:url];

    NSString *downloadPath = [localPath stringByAppendingPathComponent:fileName];
    
   
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:[NSURLRequest requestWithURL:downloadUrl]];
    
    op.outputStream = [NSOutputStream outputStreamToFileAtPath:downloadPath append:NO];
  
    [op setDownloadProgressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead) {
        CGFloat percent = (CGFloat)totalBytesRead * 100 / totalBytesExpectedToRead;
        if (progress)
        {
            progress(percent);
        }
    }];
    
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success)
        {
            success();
        }

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure)
        {
            failure();
        }
    }];
    
    [queue addOperation:op];
}
@end
