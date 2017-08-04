//
//  AndyRankMonthListModel.m
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import "AndyRankMonthListModel.h"
#import "MJExtension.h"
#import "AndyRankMonthVideoListModel.h"

@implementation AndyRankMonthListModel

- (NSDictionary *)objectClassInArray
{
    return @{@"videoList" : [AndyRankMonthVideoListModel class]};
}

@end
