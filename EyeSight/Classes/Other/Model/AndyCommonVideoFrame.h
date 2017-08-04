//
//  AndyCommonVideoFrame.h
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class AndyVideoListBaseModel;

@interface AndyCommonVideoFrame : NSObject

@property (nonatomic, strong) AndyVideoListBaseModel *videoListBaseModel;

@property (nonatomic, assign, readonly) CGRect bgViewF;

@property (nonatomic, assign, readonly) CGRect coverViewF;

@property (nonatomic, assign, readonly) CGRect titleLabelF;

@property (nonatomic, assign, readonly) CGRect categoryAndDurationLabelF;

@property (nonatomic, assign, readonly) CGFloat cellHeight;

@end
