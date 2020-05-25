//
//  UIButton+RejectRepeatTapGesture.m
//  NavigationDemo
//
//  Created by czm on 2020/5/20.
//  Copyright © 2020 czm. All rights reserved.
//

#import "UIButton+RejectRepeatTapGesture.h"
#import <objc/message.h>

static char const kRepeatTapRecordsKey = '\0';


@implementation UIButton (RejectRepeatTapGesture)

#pragma mark - Lifecycle

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL originalSelector = @selector(sendAction:to:forEvent:);
        SEL swizllingSelector = @selector(rrtg_sendAction:to:forEvent:);
        Method originalMethod = class_getInstanceMethod(self, originalSelector);
        Method swizllingMethod = class_getInstanceMethod(self, swizllingSelector);
        BOOL flag = class_addMethod(self, originalSelector, method_getImplementation(swizllingMethod), method_getTypeEncoding(swizllingMethod));
        if (flag) {
            class_replaceMethod(self, swizllingSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizllingMethod);
        }
    });
}

/**
 重写`sendAction:to:forEvent:`系统方法
 
 根据`target-action`来确定唯一的key，在规定时间内避免多次触发`[target action]`
 通过该机制能够有效避免类似 UIImagePickerController 的拍照按钮以及 UITableView 的左滑删除按钮点击无效的问题
 */
- (void)rrtg_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    if (event.type == UIEventTypeTouches && self.isEnabledRejectRepeatTap) {
        NSString * const key = [NSString stringWithFormat:@"%p%p", action, target];
        NSMutableDictionary *dictionary = objc_getAssociatedObject(self, &kRepeatTapRecordsKey);
        if (dictionary == nil) {
            dictionary = [NSMutableDictionary dictionary];
            objc_setAssociatedObject(self, &kRepeatTapRecordsKey, dictionary, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
        NSTimeInterval lasttimeTapTime = [[dictionary objectForKey:key] doubleValue];
        NSTimeInterval currentTime = [[NSDate date] timeIntervalSince1970];
        if (lasttimeTapTime > 0.0) {
            NSTimeInterval interval = currentTime - lasttimeTapTime;
            if (interval <= self.repeatTimeInterval) {
                if ([target conformsToProtocol:@protocol(UIButtonRejectRepeatTapGestureCallback)]) {
                    id<UIButtonRejectRepeatTapGestureCallback> delegate = (id<UIButtonRejectRepeatTapGestureCallback>)target;
                    [delegate rejectRepeatTapGestureFromButton:self timeInterval:interval];
                }
                return;
            }
        }
        [dictionary setObject:@(currentTime) forKey:key];
    }
    [self rrtg_sendAction:action to:target forEvent:event];
}

#pragma mark - setter & getter

- (void)setRepeatTimeInterval:(NSTimeInterval)repeatTimeInterval {
    objc_setAssociatedObject(self,
                             @selector(repeatTimeInterval),
                             @(repeatTimeInterval),
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval)repeatTimeInterval {
    NSTimeInterval timeInterval = [objc_getAssociatedObject(self, _cmd) doubleValue];
    if (timeInterval >= 0.01) {
        return timeInterval;
    }
    return 0.5; // default.
}

- (void)setEnabledRejectRepeatTap:(BOOL)enabledRejectRepeatTap {
    objc_setAssociatedObject(self,
                             @selector(isEnabledRejectRepeatTap),
                             @(enabledRejectRepeatTap),
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)isEnabledRejectRepeatTap {
    id obj = objc_getAssociatedObject(self, _cmd);
    if (obj) {
        return [obj boolValue];
    }
    return YES; // default.
}

@end
