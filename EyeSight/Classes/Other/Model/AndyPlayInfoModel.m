//
//  AndyPlayInfoModel.m
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import "AndyPlayInfoModel.h"

@implementation AndyPlayInfoModel

- (void)setUrl:(NSString *)url
{
    _url = url;
    self.uniqueId = [AndyCommonFunction computeMD5:_url];
}

@end
