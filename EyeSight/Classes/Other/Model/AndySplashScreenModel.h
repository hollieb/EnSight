//
//  AndySplashScreenModel.h
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AndyStartPageModel;
@class AndyCampaignModel;

@interface AndySplashScreenModel : NSObject

@property(nonatomic, strong) AndyStartPageModel *startPage;

@property (nonatomic, strong) AndyCampaignModel *campaignInFeed;

@end
