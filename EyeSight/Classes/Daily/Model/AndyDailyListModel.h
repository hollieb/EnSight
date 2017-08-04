//
//  AndyDailyListModel.h
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface AndyDailyListModel : NSObject

@property (nonatomic, copy) NSString *today;

@property (nonatomic, assign) long date;

@property (nonatomic, copy) NSString *realDate;

@property(nonatomic, strong) NSArray *videoList;

@end
