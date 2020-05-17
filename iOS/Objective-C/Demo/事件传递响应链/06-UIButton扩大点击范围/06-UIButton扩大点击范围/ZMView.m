//
//  ZMView.m
//  06-UIButton扩大点击范围
//
//  Created by czm on 2020/5/17.
//  Copyright © 2020 czm. All rights reserved.
//

#import "ZMView.h"

@implementation ZMView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    //判断响应条件
    if (!self.isUserInteractionEnabled || self.isHidden || self.alpha <= 0.01)
    {
        return nil;
    }
    
    //扩大10个点的点击范围
    CGRect touchRect = CGRectInset(self.bounds, -10, -10);
    
    // 如果点击的点在 ZMView 里面，则看 ZMView 里有谁可以响应
    if(CGRectContainsPoint(touchRect, point))
    {
        for (UIView *subView in [self.subviews reverseObjectEnumerator])
        {
            CGPoint convertedPoint = [subView convertPoint:point fromView:self];
            UIView *hitTestView = [subView hitTest:convertedPoint withEvent:event];
            
            if(hitTestView)
            {
                return hitTestView;
            }
        }
        return self;
    }
    return nil;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"点击了，%s", __FUNCTION__);
}

@end
