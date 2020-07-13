//
//  BlueView.m
//  02-事件传递过程
//
//  Created by czm on 2019/10/16.
//  Copyright © 2019 czm. All rights reserved.
//

#import "BlueView.h"

@implementation BlueView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    UIView *v = [super hitTest:point withEvent:event];
    NSLog(@"%s, 结果%@", __func__, v);
    return v;
}

// 判断触摸点是否在自己身上
// 它在 hitTest:withEvent: 中调用
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    BOOL bl = [super pointInside:point withEvent:event];
    NSLog(@"%s, 结果：%d", __func__, bl);
    return bl;
}

@end
