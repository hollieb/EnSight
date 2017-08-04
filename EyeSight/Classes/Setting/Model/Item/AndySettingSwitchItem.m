//
//  AndySettingSwitchItem.m
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import "AndySettingSwitchItem.h"

@implementation AndySettingSwitchItem

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title forKey:(NSString *)key forDefaultValue:(BOOL)defaultValue;
{
    AndySettingSwitchItem *item = [self itemWithIcon:icon title:title];
    item.key = key;
    item.defaultValue = defaultValue;
    return item;
}

+ (instancetype)itemWithTitle:(NSString *)title forKey:(NSString *)key forDefaultValue:(BOOL)defaultValue;
{
    AndySettingSwitchItem *item = [self itemWithTitle:title];
    item.key = key;
    item.defaultValue = defaultValue;
    return item;
}

@end
