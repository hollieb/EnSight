//
//  AndyVideoDetailTopUIImageView.m
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import "AndyVideoDetailTopUIImageView.h"
#import "UIImageView+WebCache.h"

@implementation AndyVideoDetailTopUIImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        //self.userInteractionEnabled = YES;
    }
    return self;
}

- (void)setImageUrl:(NSString *)imageUrl
{
    _imageUrl = imageUrl;
    
    __unsafe_unretained typeof(self) selfImageView = self;
    
    [self setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
        [UIView animateWithDuration:0.2 animations:^{
            selfImageView.alpha = 1.0;
        }];
    }];
    //[self setImageWithURL:[NSURL URLWithString:imageUrl]];
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"transform.scale";
    anim.values = @[@(1.0), @(1.05), @(1.0)];
    anim.duration = 10.0;
    anim.repeatCount = MAXFLOAT;
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    [self.layer addAnimation:anim forKey:@"scale"];
    

    //[self.layer removeAnimationForKey:@"shake"];
    
//    [UIView animateWithDuration:3 animations:^{
//        self.transform = CGAffineTransformMakeScale(2, 2);
//    } completion:^(BOOL finished) {
//        self.transform = CGAffineTransformIdentity;
//    }];
}

@end
