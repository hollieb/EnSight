//
//  AndyCategoryCell.h
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AndyCateogryModel.h"

@interface AndyCategoryCell : UICollectionViewCell

@property (nonatomic, weak) UIView *coverView;
@property (nonatomic, weak) UIImageView *bgImageView;

@property (nonatomic, strong) AndyCateogryModel *categoryModel;

@end
