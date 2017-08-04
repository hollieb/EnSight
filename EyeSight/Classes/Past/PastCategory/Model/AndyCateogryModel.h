//
//  AndyCateogryModel.h
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AndyVideoAlbumScrollCallBack;

@interface AndyCateogryModel : NSObject

@property (nonatomic, assign) NSInteger categoryId;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *alias;

@property (nonatomic, copy) NSString *bgPicture;

@property (nonatomic, copy) NSString *bgColor;

@property(nonatomic, strong) AndyVideoAlbumScrollCallBack *videoAlbumScrollCallBack;

@end
