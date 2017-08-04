//
//  AndyCampaignModel.h
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.//

#import <Foundation/Foundation.h>

@interface AndyCampaignModel : NSObject

@property (nonatomic, copy) NSString *imageUrl;

@property (nonatomic, copy) NSString *version;

@property (nonatomic, copy) NSString *actionUrl;

@property (nonatomic, assign) BOOL available;

@end
