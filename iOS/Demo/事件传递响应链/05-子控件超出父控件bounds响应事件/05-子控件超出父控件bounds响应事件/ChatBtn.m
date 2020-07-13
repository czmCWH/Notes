//
//  ChatBtn.m
//  05-子控件超出父控件bounds响应事件
//
//  Created by czm on 2019/10/17.
//  Copyright © 2019 czm. All rights reserved.
//

#import "ChatBtn.h"

@implementation ChatBtn

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    UIButton *popBtn = (UIButton *)[self viewWithTag:111];
    if (popBtn) {
        
        // 判断点击的点在不在popBtn身上
        CGPoint popBtnP = [self convertPoint:point toView:popBtn];
        
        if ([popBtn pointInside:popBtnP withEvent:event]) {
            return popBtn;
        } else {
            return [super hitTest:point withEvent:event];
        }
    } else {
        return [super hitTest:point withEvent:event];
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    
    CGPoint preP = [touch previousLocationInView:self];
    CGPoint currP = [touch locationInView:self];
    
    CGFloat offX = currP.x - preP.x;
    CGFloat offY = currP.y - preP.y;
    
    self.transform = CGAffineTransformTranslate(self.transform, offX, offY);
}

@end
