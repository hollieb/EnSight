//
//  AndyVideoDetailPlayUIView.m
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#import "AndyVideoDetailPlayUIView.h"

#define AndyFillCircleColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:0.1]

@implementation AndyVideoDetailPlayUIView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    DrawFillCircle(ctx, rect);
    
    DrawStrokeCircle(ctx, rect);
    
    DrawStrokeTriangle(ctx, rect);
}

void DrawStrokeCircle(CGContextRef ctx, CGRect rect)
{
    [[UIColor whiteColor] set];
    
    CGContextSetLineWidth(ctx, 1);
    
 
    CGFloat circleRadius = (rect.size.width / 2) * 0.9;
   
    CGFloat circleX = rect.size.width / 2;
    CGFloat circleY = circleX;
    CGContextAddArc(ctx, circleX, circleY, circleRadius, 0, M_PI * 2, 0);
    
    CGContextStrokePath(ctx);
}

void DrawFillCircle(CGContextRef ctx, CGRect rect)
{
    [AndyFillCircleColor(0, 0, 0) set];
    CGFloat insideCircleRadius = (rect.size.width / 2)  * 0.9;
    CGFloat insideCircleX = rect.size.width / 2;
    CGFloat insideCircleY = insideCircleX;
    CGContextAddArc(ctx, insideCircleX, insideCircleY, insideCircleRadius, 0, M_PI * 2, 0);
    
    CGContextFillPath(ctx);
}

void DrawStrokeTriangle(CGContextRef ctx, CGRect rect)
{
    [[UIColor whiteColor] set];
    
    CGContextSetLineWidth(ctx, 1);
    CGContextSetLineCap(ctx, kCGLineCapRound);
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    
    CGFloat triangleW = 16;
    CGFloat triangleH = triangleW;
    
    CGContextMoveToPoint(ctx, (rect.size.width - triangleW + 5) / 2, (rect.size.height - triangleH) / 2);
    CGContextAddLineToPoint(ctx, (rect.size.width + triangleW + 5) / 2, rect.size.height / 2);
    CGContextAddLineToPoint(ctx, (rect.size.width - triangleW + 5) / 2, (rect.size.height + triangleH) / 2);
    CGContextClosePath(ctx);
    
    CGContextStrokePath(ctx);
}

@end
