//
//  AndyDailyHeaderView.h
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AndyDailyListModel;

@interface AndyDailyHeaderView : UITableViewHeaderFooterView

+ (instancetype)viewWithTableView:(UITableView *)tableView;

@property(nonatomic, strong) AndyDailyListModel *dailyListModel;

@end
