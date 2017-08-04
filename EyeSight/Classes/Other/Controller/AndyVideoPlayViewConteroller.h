//
//  AndyVideoPlayViewConteroller.h
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AndyVideoListBaseModel;

@interface AndyVideoPlayViewConteroller : UIViewController

@property(nonatomic, strong) NSURL *playNSURL;

@property (nonatomic, copy) NSString *videoTitle;

@property(nonatomic, strong) AndyVideoListBaseModel *videoModel;

@end
