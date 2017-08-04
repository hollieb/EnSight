//
//  AndySettingLabelItem.h
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import "AndySettingItem.h"

@interface AndySettingLabelItem : AndySettingItem

@property (nonatomic, copy) NSString *LabelInfo;

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title labelInfo:(NSString *)labelInfo;
+ (instancetype)itemWithTitle:(NSString *)title labelInfo:(NSString *)labelInfo;

@end
