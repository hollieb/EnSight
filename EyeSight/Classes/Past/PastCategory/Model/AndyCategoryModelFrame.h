//
//  AndyCategoryModelFrame.h
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AndyCateogryModel.h"

@interface AndyCategoryModelFrame : NSObject

@property (nonatomic, strong) AndyCateogryModel *categoryModel;

@property (nonatomic, assign, readonly) CGRect nameViewF;

@property (nonatomic, assign, readonly) CGRect bgPictureViewF;

@property (nonatomic, assign, readonly) CGRect coverViewF;

@end
