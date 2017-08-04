//
//  AndyDailyPlayListParams.h
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AndyDailyPlayListParams : NSObject

@property (nonatomic, copy) NSString *date;

@property (nonatomic, assign) NSInteger num;

+ (instancetype)params;

@end
