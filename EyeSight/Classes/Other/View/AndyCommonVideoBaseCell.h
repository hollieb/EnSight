//
//  AndyCommonVideoBaseCell.h
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AndyCommonVideoBaseCell;

@protocol AndyCommonVideoBaseCellDelegate <NSObject>

@optional
- (void)cellViewDidHolding:(AndyCommonVideoBaseCell *)andyCommonVideoBaseCell;
- (void)cellViewDidReleaseHolding:(AndyCommonVideoBaseCell *)andyCommonVideoBaseCell;
- (void)cellViewNeedNavigate:(AndyCommonVideoBaseCell *)andyCommonVideoBaseCell;
@end

@interface AndyCommonVideoBaseCell : UITableViewCell

@property (nonatomic, weak) id<AndyCommonVideoBaseCellDelegate> delegate;

- (void)myHolding;

- (void)myRelease;

- (void)myNavigate;

@end
