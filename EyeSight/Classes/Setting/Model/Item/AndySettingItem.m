//
//  AndySettingItem.m
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import "AndySettingItem.h"

@implementation AndySettingItem

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title subTitle:(NSString *)subTitle
{
    AndySettingItem *item = [[self alloc] init];
    item.icon = icon;
    item.title = title;
    item.subTile = subTitle;
    return item;
}

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title
{
    return [self itemWithIcon:icon title:title subTitle:nil];
}

+ (instancetype)itemWithTitle:(NSString *)title
{
    return [self itemWithIcon:nil title:title subTitle:nil];
}

+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle
{
    return [self itemWithIcon:nil title:title subTitle:subTitle];
}

@end
