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
    NSLog(@"BlueView，self = %@, v = %@ --- hitTest:", [self class], [v class]);
    return v;
}

@end
