//
//  AndySlideView.h
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AndySlideView;

@protocol AndyslideViewDelegate <NSObject>

@optional
- (void)slideView:(AndySlideView *)slideView didScrollViewTo:(int)to;

@end

@interface AndySlideView : UIView

- (void)setupViewControllersArray:(NSArray *)vcArr withTitleArray:(NSArray *)titleArr;

@property (nonatomic, weak) id<AndyslideViewDelegate> delagate;

@end
