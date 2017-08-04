//
//  AndyCommonVideoPlayViewController.h
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AndyVideoListBaseModel.h"

@protocol AndyCommonVideoPlayViewControllerDelegate<NSObject>

@required
- (void)moviePlayerDidFinished;

@end

@interface AndyCommonVideoPlayViewController : UIViewController

@property (nonatomic, strong) AndyVideoListBaseModel *videoModel;

@property (nonatomic, weak) id<AndyCommonVideoPlayViewControllerDelegate> delegate;

@end
