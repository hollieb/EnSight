//
//  AndyPastDetailListModel.m
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import "AndyPastDetailListModel.h"
#import "MJExtension.h"
#import "AndyPastDetailVideoListModel.h"

@implementation AndyPastDetailListModel

- (NSDictionary *)objectClassInArray
{
    return @{@"videoList" : [AndyPastDetailVideoListModel class]};
}

@end
