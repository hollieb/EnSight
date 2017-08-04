//
//  AndyFavoriteVideoCell.h
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AndyCommonVideoBaseCell.h"

@class AndyCommonVideoFrame;

@interface AndyFavoriteVideoCell : AndyCommonVideoBaseCell<AndyCommonVideoBaseCellDelegate>

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property(nonatomic, strong) AndyCommonVideoFrame *commonVideoFrame;

@end
