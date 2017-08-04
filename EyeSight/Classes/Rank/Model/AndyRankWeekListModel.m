//
//  AndyRankWeekListModel.m
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import "AndyRankWeekListModel.h"
#import "MJExtension.h"
#import "AndyRankWeekVideoListModel.h"

@implementation AndyRankWeekListModel

- (NSDictionary *)objectClassInArray
{
    return @{@"videoList" : [AndyRankWeekVideoListModel class]};
}

@end
