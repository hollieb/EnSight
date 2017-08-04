//
//  AndyDailyGroupModel.h
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AndyDailyGroupModel : NSObject
@property (nonatomic, copy) NSString *today;

@property (nonatomic, assign) long date;

@property(nonatomic, strong) NSArray *videoList;

- (instancetype)initWithDict:(NSDictionary *)dict;
- (instancetype)dailyGroupWithDict:(NSDictionary *)dict;

@end
