//
//  AndyTabBar.h
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AndyTabBar;

@protocol AndyTabBarDelegate <NSObject>

@optional
- (void)tabBar:(AndyTabBar *)tabBar didSelectedButtonFrom:(int)from to:(int)to;

@end

@interface AndyTabBar : UIView

- (void)addTabBarButtonWithItem:(UITabBarItem *)item;

@property (nonatomic, weak) id<AndyTabBarDelegate> delegate;

@end
