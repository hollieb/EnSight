//
//  AndyQualityView.h
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AndyQualityView;

@protocol AndyQualityViewDelegate <NSObject>

@optional
- (void)qualityView:(AndyQualityView *)qualityView didClickedButtonWithQualityLabel:(NSString *)qualityLabel andPlayUrl:(NSURL *)playNSURL from:(int)from to:(int)to;

@end

@interface AndyQualityView : UIView

- (void)setupQualityButtonWithArray:(NSArray *)qualityArray;

@property (nonatomic, weak) id<AndyQualityViewDelegate> delegate;

@end
