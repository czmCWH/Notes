//
//  ZMWindow.m
//  02-事件传递过程
//
//  Created by czm on 2019/10/16.
//  Copyright © 2019 czm. All rights reserved.
//

#import "ZMWindow.h"

@implementation ZMWindow

/// 返回接收事件的对象，该对象是当前视图或者其后代。如果 pointInside: withEvent: 返回NO，则其返回 nil
/// 该方法会调用每个子视图的 pointInside: withEvent: 方法遍历视图的层次结构，来确定那个视图接收事件
/// @param point 接受者坐标系中的点
/// @param event 需要调用此方法的事件
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"=========================================");
    NSLog(@"%s, %p", __func__, event);
    UIView *v = [super hitTest:point withEvent:event];
    NSLog(@"===ZMWindow 结果：%@ 的对象", [v class]);
    return v;
}

/// 判断触摸点是否在自己身上
/// 它在 hitTest:withEvent: 中被调用。如果返回YES，则遍历子视图的层次结构，找到包含指定点的最前面的视图。
/// 如果视图不包含该点或者设置视图无法接收事件，则忽略其视图的层次结构的分支，并且返回NO
/// @param point 当前视图坐标系内的一个点
/// @param event 需要调用此方法的事件
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"%s", __func__);
    
    BOOL bl = [super pointInside:point withEvent:event];
    NSLog(@"===ZMWindow 结果：%d", bl);
    return bl;
}

@end
