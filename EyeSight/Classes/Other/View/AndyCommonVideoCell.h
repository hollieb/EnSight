//
//  AndyCommonVideoCell.h
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AndyCommonVideoBaseCell.h"

@class AndyCommonVideoFrame;
@class AndyCommonVideoCell;


//@protocol AndyCommonVideoCellDelegate <NSObject>
//
//@optional
//- (void)commonCellViewNeedNavigate:(AndyCommonVideoCell *)andyCommonViewCell;
//
//@end


@interface AndyCommonVideoCell : AndyCommonVideoBaseCell<AndyCommonVideoBaseCellDelegate>

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property(nonatomic, strong) AndyCommonVideoFrame *commonVideoFrame;

//@property (nonatomic, weak) id<AndyCommonVideoCellDelegate> commonDelegate;

@end
