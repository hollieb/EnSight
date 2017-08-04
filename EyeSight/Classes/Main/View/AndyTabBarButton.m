//
//  AndyTabBarButton.m
//  EnSight
//
//  Created by Hollie Bradley on 10/15/15.
//  Copyright © 2015 Hollie Bradley. All rights reserved.
//

#define AndyTabBarButtonImageRatio 0.6

#define AndyTabBarButtonTitleColor [UIColor blackColor]

#define AndyTabBarButtonTitleSelectedColor AndyColor(51, 182, 236, 1.0)

#import "AndyTabBarButton.h"
#import "AndyBadgeButton.h"

@interface AndyTabBarButton()

@property (nonatomic, weak) AndyBadgeButton *badgeButton;

@end

@implementation AndyTabBarButton
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.imageView.contentMode = UIViewContentModeCenter;
        
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        self.titleLabel.font = [UIFont systemFontOfSize:11];
       
        [self setTitleColor:AndyTabBarButtonTitleColor forState:UIControlStateNormal];
        [self setTitleColor:AndyTabBarButtonTitleSelectedColor forState:UIControlStateSelected];
    
        
        AndyBadgeButton *badgeButton = [[AndyBadgeButton alloc] init];
#warning AutoLayoutautoresizingMask "|"。
        badgeButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
        [self addSubview:badgeButton];
        self.badgeButton = badgeButton;
    }
    return self;
}

// 重写去掉高亮状态
#warning setHighlighted
- (void)setHighlighted:(BOOL)highlighted {}

#warning imageRectForContentRect
// frame
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * AndyTabBarButtonImageRatio;
    return CGRectMake(0, 0, imageW, imageH);
}

#warning titleRectForContectRect
// frame
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = contentRect.size.height * AndyTabBarButtonImageRatio;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - titleY;
    return CGRectMake(0, titleY, titleW, titleH);
}

// item
- (void)setItem:(UITabBarItem *)item
{
    _item = item;
    
    // KVO
#warning KVO
    [item addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
    [item addObserver:self forKeyPath:@"title" options:0 context:nil];
    [item addObserver:self forKeyPath:@"image" options:0 context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
    
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
}

- (void)dealloc
{
    [self.item removeObserver:self forKeyPath:@"badgeValue"];
    [self.item removeObserver:self forKeyPath:@"title"];
    [self.item removeObserver:self forKeyPath:@"image"];
    [self.item removeObserver:self forKeyPath:@"selectedImage"];
}

/**
 *   *
 *  @param keyPath 
 *  @param object
 *  @param change
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    //
    [self setTitle:self.item.title forState:UIControlStateSelected];
    [self setTitle:self.item.title forState:UIControlStateNormal];
    
    //
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
    
    //
    self.badgeButton.badgeValue = self.item.badgeValue;
    
    CGFloat badgeY = 5;
    CGFloat badgeX = self.frame.size.width - self.badgeButton.frame.size.width - 10;
    CGRect badgeF = self.badgeButton.frame;
    badgeF.origin.x = badgeX;
    badgeF.origin.y = badgeY;
    self.badgeButton.frame = badgeF;
}

@end



















