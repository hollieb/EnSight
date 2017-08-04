//
//  AndyRankAllListModel.m
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import "AndyRankAllListModel.h"
#import "MJExtension.h"
#import "AndyRankAllVideoListModel.h"

@implementation AndyRankAllListModel

- (NSDictionary *)objectClassInArray
{
    return @{@"videoList" : [AndyRankAllVideoListModel class]};
}

@end
