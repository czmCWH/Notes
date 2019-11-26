//
//  RedView.m
//  02-事件传递过程
//
//  Created by czm on 2019/10/16.
//  Copyright © 2019 czm. All rights reserved.
//

#import "RedView.h"

@implementation RedView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"%s", __func__);
    UIView *v = [super hitTest:point withEvent:event];
    NSLog(@"===RedView 结果：%@ 的对象", [v class]);
    return v;
}

// 判断触摸点是否在自己身上
// 它在 hitTest:withEvent: 中调用
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"%s", __func__);
    BOOL bl = [super pointInside:point withEvent:event];
    NSLog(@"===RedView 结果：%d", bl);
    return bl;
}


@end
