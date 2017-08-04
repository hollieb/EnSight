//
//  AndyCommonVideoBaseCell.m
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import "AndyCommonVideoBaseCell.h"

@interface AndyCommonVideoBaseCell ()

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, assign) int count;

@property (nonatomic, assign) BOOL isPressed;

@property (nonatomic, assign) BOOL isMoved;

@end

@implementation AndyCommonVideoBaseCell

- (void)myHolding
{
    
}

- (void)myRelease
{
    
}

- (void)myNavigate
{
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.count = 0;
    
    [self removeTimer];
    
    if (self.timer == nil)
    {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.005 target:self selector:@selector(countAutoIncrease) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    }
}

- (void)countAutoIncrease
{
    self.count++;
    
    if (self.count >= 1)
    {
        [self removeTimer];
        self.isPressed = true;
        
        AndyLog(@"begin %d", self.isPressed);
        
        if ([self.delegate respondsToSelector:@selector(cellViewDidHolding:)])
        {
            [self.delegate cellViewDidHolding:self];
            
            [self myHolding];
        }
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self removeTimer];
    
    self.isMoved = true;
    
    if (self.isPressed)
    {
        self.isPressed = false;
        
        AndyLog(@"move %d", self.isPressed);
    }
    
    if ([self.delegate respondsToSelector:@selector(cellViewDidReleaseHolding:)])
    {
        [self.delegate cellViewDidReleaseHolding:self];
        
        [self myRelease];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self removeTimer];
    
    AndyLog(@"end %d", self.isPressed);
    
    if (self.isPressed)
    {
        self.isPressed = false;
        
        if ([self.delegate respondsToSelector:@selector(cellViewDidReleaseHolding:)])
        {
            [self.delegate cellViewDidReleaseHolding:self];
            
            [self myRelease];
        }
    }

//    if (!self.isMoved)
//    {
        if ([self.delegate respondsToSelector:@selector(cellViewNeedNavigate:)])
        {
            [self.delegate cellViewNeedNavigate:self];
            
            [self myNavigate];
        }
    //}
    
    self.isMoved = false;
}

- (void)removeTimer
{
    [self.timer invalidate];
    self.timer = nil;
}

@end
