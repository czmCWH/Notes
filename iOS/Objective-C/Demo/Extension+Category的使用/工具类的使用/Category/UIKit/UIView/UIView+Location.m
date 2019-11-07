//
//  UIView+Location.m
//  工具类的使用
//
//  Created by czm on 2019/11/7.
//  Copyright © 2019 czm. All rights reserved.
//

#import "UIView+Location.h"

@implementation UIView (Location)

- (CGRect)convertSubview:(UIView *)subview toTargetView:(UIView *)targetView {
   return [self convertRect:subview.frame toView:targetView];
}

- (CGRect)convertView:(UIView *)view {
    return [self convertRect:view.frame fromView:view.superview];
}

@end
