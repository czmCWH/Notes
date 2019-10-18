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
    
    UIView *v = [super hitTest:point withEvent:event];
    NSLog(@"ZMWindow，self = %@, v = %@ --- hitTest:", [self class], [v class]);
    return v;
}

@end
