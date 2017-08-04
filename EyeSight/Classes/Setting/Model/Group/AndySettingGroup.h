//
//  AndySettingGroup.h
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AndySettingGroup : NSObject

@property (nonatomic, copy) NSString *header;

@property (nonatomic, copy) NSString *footer;

@property(nonatomic, strong) NSArray *items;

@end
