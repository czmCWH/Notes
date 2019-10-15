//
//  ZMRedView.m
//  事件响应(一)
//
//  Created by czm on 2019/10/15.
//  Copyright © 2019 czm. All rights reserved.
//

#import "ZMRedView.h"
#import "UIView+Extension.h"

@implementation ZMRedView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    NSLog(@"手指开始触摸屏幕：%s", __func__);
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    NSLog(@"触摸时开始移动：%s", __func__);
    UITouch *touch = [touches anyObject];
    CGPoint previousP = [touch previousLocationInView:self];
    CGPoint currentP = [touch locationInView:self];
    CGFloat offsetX = currentP.x - previousP.x;
    CGFloat offsetY = currentP.y - previousP.y;
    
    // 平移
    self.transform = CGAffineTransformTranslate(self.transform, offsetX, offsetY);
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    NSLog(@"手指离开屏幕：%s", __func__);
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    NSLog(@"发生系统事件（电话、关机）结束点击：%s", __func__);
}

- (void)touchesEstimatedPropertiesUpdated:(NSSet<UITouch *> *)touches {
    NSLog(@"ios(9.1)及以上，为Apple Pencil 的特性设计：%s", __func__);
}


@end
