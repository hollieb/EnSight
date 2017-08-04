//
//  AndyVideoDetailView.h
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AndyVideoListBaseModel.h"
#import "AndyVideoDetailOperateButton.h"

@interface AndyVideoDetailViewCell : UITableViewCell

@property (nonatomic, strong) AndyVideoListBaseModel *videoModel;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, weak) AndyVideoDetailOperateButton *favoriteButton;

@property (nonatomic, weak) AndyVideoDetailOperateButton *downloadButton;

@end
