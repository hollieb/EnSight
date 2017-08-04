//
//  AndySettingLabelItem.m
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import "AndySettingLabelItem.h"

@implementation AndySettingLabelItem

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title labelInfo:(NSString *)labelInfo
{
    AndySettingLabelItem *item = [self itemWithIcon:icon title:title];
    item.LabelInfo = labelInfo;
    return item;
}

+ (instancetype)itemWithTitle:(NSString *)title labelInfo:(NSString *)labelInfo
{
    AndySettingLabelItem *item = [self itemWithTitle:title];
    item.LabelInfo = labelInfo;
    return item;
}

@end
