//
//  SkyBlueView.m
//  04-被遮挡的View响应点击事件
//
//  Created by czm on 2019/10/16.
//  Copyright © 2019 czm. All rights reserved.
//

#import "SkyBlueView.h"

@interface SkyBlueView ()

@property (nonatomic, weak) IBOutlet UIButton *redBtn;

@end

@implementation SkyBlueView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"====%@, %s", [self class], __func__);
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
     
    // 判断触摸点是否在button上
    CGPoint btnP = [self convertPoint:point toView:self.redBtn];
    if ([self.redBtn pointInside:btnP withEvent:event]) {
        return self.redBtn;
    } else {
        return [super hitTest:point withEvent:event];
    }
}

@end
