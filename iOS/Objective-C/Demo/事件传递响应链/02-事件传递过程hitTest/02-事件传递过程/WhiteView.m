//
//  WhiteView.m
//  02-事件传递过程
//
//  Created by czm on 2019/10/16.
//  Copyright © 2019 czm. All rights reserved.
//

#import "WhiteView.h"

@implementation WhiteView

/*
 当一个事件传递给view的时候，就会调用
 
 无法接收事件响应的控件(如：hidden等)，不执行该方法
 该方法通过 pointInside:withEvent: 方法来遍历子视图层次结构，确定那个子视图应该接收触摸事件。
 **/
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
     NSLog(@"%s", __func__);
    UIView *v = [super hitTest:point withEvent:event];
    NSLog(@"===WhiteView 结果：%@ 的对象", [v class]);
    return v;
}

// 判断触摸点是否在自己身上
// 它在 hitTest:withEvent: 中调用
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
     NSLog(@"%s", __func__);
    BOOL bl = [super pointInside:point withEvent:event];
    NSLog(@"===WhiteView 结果：%d", bl);
    return bl;
}



@end
