//
//  ZMWindow.m
//  02-事件传递过程
//
//  Created by czm on 2019/10/16.
//  Copyright © 2019 czm. All rights reserved.
//

#import "ZMWindow.h"

@implementation ZMWindow

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    NSLog(@"=========================================");
    
    // 1.判断自己能否接收事件
    if (self.userInteractionEnabled == NO || self.hidden == YES || self.alpha <= 0.01) {
        return nil;
    }
    
    // 2.判断当前点在不在当前View
    if (![self pointInside:point withEvent:event]) {
        return nil;
    }
    
    // 3.从后往前遍历自己身上的子控件，让子控件重复前2步操作
    
    NSInteger count = self.subviews.count;
    for (NSInteger i = count - 1; i >= 0; i--) {
        UIView *childV = self.subviews[i];
        
        // 把当前点转换为子控件上的点
        CGPoint childP = [self convertPoint:point toView:childV];
        
        UIView *fitV = [childV hitTest:childP withEvent:event];
        
        // 判断有没有找到最合的view
        if (fitV) {
            return fitV;
        }
    }
    
    // 4.没有找到最合适的view，那么它自己就是最合适的view
    return self;
}

@end
