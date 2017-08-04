//
//  AndyPlayInfoModel.h
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AndyPlayInfoModel : NSObject

@property (nonatomic, copy) NSString *uniqueId;

@property (nonatomic, assign) NSInteger parentId;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *url;

@end
