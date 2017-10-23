//
//  UIScrollView+StrechableHeader.m
//  sj
//
//  Created by Peter Hu on 2017/6/10.
//  Copyright © 2017年 Peter Hu. All rights reserved.
//  Like it, Star it on github: https://github.com/HeterPu/StrechableHeader
//

#import "UIScrollView+StrechableHeader.h"
#import <objc/runtime.h>

#define k_ScrechableHeaderNaviHeight 64;

static NSString *headerVstrKey = @"headerVstrKey";
static NSString *headerVIsHiddenKey = @"headerVIsHiddenKey";

@interface UIScrollView()

@property (nonatomic, strong) UIView *headerV;
@property (nonatomic,assign)float defaultHeight;
@property(nonatomic,strong)NSNumber *isHideNaviBar;

@end

@implementation UIScrollView (StrechableHeader)


-(void)setHeaderV:(UIView *)headerV {
    objc_setAssociatedObject(self, &headerVstrKey, headerV, OBJC_ASSOCIATION_RETAIN);
}


-(UIView *)headerV {
    return objc_getAssociatedObject(self, &headerVstrKey);
}

-(NSNumber *)isHideNaviBar {
    return objc_getAssociatedObject(self, &headerVIsHiddenKey);
}

-(void)setIsHideNaviBar:(NSNumber *)isHideNaviBar {
    objc_setAssociatedObject(self, &headerVIsHiddenKey, isHideNaviBar, OBJC_ASSOCIATION_RETAIN);
}


-(void)setStrechHeader:(UIView *)header withNaviBarHidden:(BOOL)isHidden{
    header.frame = CGRectMake(0, -header.bounds.size.height, [UIScreen mainScreen].bounds.size.width, header.bounds.size.height);
    UIEdgeInsets inset = self.contentInset;
    inset.top = header.bounds.size.height;
    self.isHideNaviBar = @(isHidden);
    
    if([self isOverIos11]){
        if([self getScrollViewContentInsetAdjustment]){
            if (!isHidden) {
                inset.top = header.bounds.size.height + k_ScrechableHeaderNaviHeight;
            }
        }
    }
    else
    {
        if (!isHidden) {
            inset.top = header.bounds.size.height + k_ScrechableHeaderNaviHeight;
        }
    }

    self.contentInset = inset;
    [self addSubview:header];
    self.headerV = header;
    self.headerV.tag = header.bounds.size.height;
}


#warning if you‘re xcode below xcode9.0, Coment it.
-(BOOL)getScrollViewContentInsetAdjustment{
       if (!self.contentInsetAdjustmentBehavior) {
        if ([[UIScrollView appearance] contentInsetAdjustmentBehavior]==UIScrollViewContentInsetAdjustmentNever) {
            return true;
        }
    }
    return false;
}




-(BOOL)isOverIos11{
    return [[[UIDevice currentDevice] systemVersion] floatValue]>=11.0f;
}



-(void)updateStrechHeader{

    CGFloat headerHeight = self.headerV.tag;
    CGFloat naviOffset = ((self.contentInset.top - headerHeight) == 0) ? 0 : k_ScrechableHeaderNaviHeight;
    CGFloat zero = self.contentOffset.y + headerHeight + naviOffset;
    
    // 区分contentInsetAdjustmentBehavior
    if (!self.isHideNaviBar.boolValue&&(naviOffset==0)) {
        zero = self.contentOffset.y + headerHeight + naviOffset + k_ScrechableHeaderNaviHeight;
    }
    CGRect tempt = CGRectMake(0, -headerHeight, [UIScreen mainScreen].bounds.size.width, headerHeight);
    if ( zero < -0.5) {
        tempt.origin.y += zero;
        tempt.size.height -= zero;
        self.headerV.frame = tempt;
    }
    else if (-0.5 < zero || zero < 2 )
    {
        
        self.headerV.frame = tempt;
    }
    
}



@end
