//
//  AndySettingCell.h
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AndySettingItem;

@interface AndySettingCell : UITableViewCell

@property(nonatomic, strong) AndySettingItem *item;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
