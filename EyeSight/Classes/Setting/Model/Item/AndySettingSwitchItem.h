//
//  AndySettingSwitchItem.h
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import "AndySettingItem.h"

@interface AndySettingSwitchItem : AndySettingItem

@property (nonatomic, copy) NSString *key;

@property (nonatomic, assign) BOOL defaultValue;

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title forKey:(NSString *)key forDefaultValue:(BOOL)defaultValue;
+ (instancetype)itemWithTitle:(NSString *)title forKey:(NSString *)key forDefaultValue:(BOOL)defaultValue;

@end
