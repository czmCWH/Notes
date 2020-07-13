//
//  UIControl+Touch.m
//  工具类的使用
//
//  Created by czm on 2019/11/12.
//  Copyright © 2019 czm. All rights reserved.
//

#import "UIControl+Touch.h"
#import <objc/message.h>

@implementation UIControl (Touch)

static char acceptEventIntervalKey;
static char acceptEventTimeKey;

+ (void)load {
    Method sendAction = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method zm_sendAction = class_getInstanceMethod(self, @selector(zm_sendAction:to:forEvent:));
    method_exchangeImplementations(sendAction, zm_sendAction);
}

- (NSTimeInterval)acceptEventInterval {
    return [objc_getAssociatedObject(self, &acceptEventIntervalKey) doubleValue];
}

- (void)setAcceptEventInterval:(NSTimeInterval)acceptEventInterval {
    objc_setAssociatedObject(self, &acceptEventIntervalKey, @(acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval)acceptEventTime {
    return [objc_getAssociatedObject(self, &acceptEventTimeKey) doubleValue];
}

- (void)setAcceptEventTime:(NSTimeInterval)acceptEventTime {
    objc_setAssociatedObject(self, &acceptEventTimeKey, @(acceptEventTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)zm_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    if ([[NSDate date] timeIntervalSince1970] - self.acceptEventTime < self.acceptEventInterval) {
        return;
    }
    if (self.acceptEventInterval > 0) {
        self.acceptEventTime = [[NSDate date] timeIntervalSince1970];
    }
    [self zm_sendAction:action to:target forEvent:event];
}


@end
