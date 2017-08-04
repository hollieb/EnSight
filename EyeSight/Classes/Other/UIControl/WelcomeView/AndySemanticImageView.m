//
//  AndySemanticImageView.m
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import "AndySemanticImageView.h"

@implementation AndySemanticImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
    }
    return self;
}

- (void)setImageData:(NSData *)imageData
{
    _imageData = imageData;
    
    self.image = [UIImage imageWithData:imageData];
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"transform.scale";
    anim.values = @[@(1.0), @(1.3)];
    anim.duration = 6.0;
    anim.repeatCount = MAXFLOAT;
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    [self.layer addAnimation:anim forKey:@"scale"];
}

@end
