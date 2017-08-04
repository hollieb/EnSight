//
//  AndyDailyPlayListParams.m
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import "AndyDailyPlayListParams.h"

@implementation AndyDailyPlayListParams

- (NSInteger)num
{
    return 10;
}

- (NSString *)date
{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyyMMdd"];
    
    NSString *currentDateStr = [dateFormat stringFromDate:[NSDate date]];
    
    return currentDateStr;
}

+ (instancetype)params
{
    return [[self alloc] init];
}

@end
