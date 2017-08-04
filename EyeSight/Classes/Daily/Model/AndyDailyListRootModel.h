//
//  AndyDailyListRootModel.h
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AndyDailyListRootModel : NSObject

@property (nonatomic, strong) NSArray *dailyList;

@property (nonatomic, copy) NSString *nextPageUrl;

@end
