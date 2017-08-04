//
//  AndySettingAlertArrowItem.m
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import "AndySettingAlertArrowItem.h"

@implementation AndySettingAlertArrowItem

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title labelInfo:(NSString *)labelInfo
{
    AndySettingAlertArrowItem *item = [self itemWithIcon:icon title:title];
    item.LabelInfo = labelInfo;
    return item;
}

+ (instancetype)itemWithTitle:(NSString *)title labelInfo:(NSString *)labelInfo
{
    AndySettingAlertArrowItem *item = [self itemWithTitle:title];
    item.LabelInfo = labelInfo;
    return item;
}

@end
