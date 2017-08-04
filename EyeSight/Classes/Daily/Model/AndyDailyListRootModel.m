//
//  AndyDailyListRootModel.m
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import "AndyDailyListRootModel.h"
#import "MJExtension.h"
#import "AndyDailyListModel.h"

@implementation AndyDailyListRootModel

- (NSDictionary *)objectClassInArray
{
    return @{@"dailyList" : [AndyDailyListModel class]};
}

@end
