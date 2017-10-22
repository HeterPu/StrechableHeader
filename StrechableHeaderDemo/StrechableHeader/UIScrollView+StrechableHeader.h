//
//  UIScrollView+StrechableHeader.h
//  sj
//
//  Created by Peter Hu on 2017/6/10.
//  Copyright © 2017年  Peter Hu. All rights reserved.
//  Like it, Star it on github: https://github.com/HeterPu/StrechableHeader
//

#import <UIKit/UIKit.h>


@interface UIScrollView (StrechableHeader)


/**
 Set Strechable Header.
 (设置可拉伸的头部).
 @param header  Most important property is height,strechheader will ignore other frame property.
 (要拉伸的头部view，最重要的为高度属性,其它的都不重要，属性设置在viewDidAppear之前。)
 @param isHidden NavigationBar isHiiden or not.
 （导航栏是否隐藏）
 */
-(void)setStrechHeader:(UIView *)header withNaviBarHidden:(BOOL)isHidden;


/**
 UpdateHeaderHeight,put it in -scrollDidScroll,Default navi bar hidden;
 (更新头部高度，放在-scrollDidScroll方法中。)
 */
-(void)updateStrechHeader;



@end
