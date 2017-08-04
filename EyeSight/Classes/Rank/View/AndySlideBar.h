//
//  AndySlideBar.h
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AndySlideView.h"

@class AndySlideBar;

@protocol AndySlideBarDelegate <NSObject>

@optional
- (void)slideBar:(AndySlideBar *)slideBar didSelectedButtonFrom:(long)from to:(long)to;

@end

@interface AndySlideBar : UIView

@property(nonatomic, strong) AndySlideView *slideView;

- (void)setupSlideBarButtonsArray:(NSArray*)titleArr;

@property (nonatomic, weak) id<AndySlideBarDelegate> delegate;

@end
