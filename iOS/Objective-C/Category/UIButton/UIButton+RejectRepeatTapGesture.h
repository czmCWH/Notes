//
//  UIButton+RejectRepeatTapGesture.h
//  NavigationDemo
//
//  Created by czm on 2020/5/20.
//  Copyright © 2020 czm. All rights reserved.
//
// http://www.0daybug.com/2018/0906/iOS-UIButton-repeat-tap/index.html

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (RejectRepeatTapGesture)

/// 重复点击的时间间隔, 默认`0.5s`
@property (nonatomic, assign) IBInspectable double repeatTimeInterval;
/// 是否启用防重复功能, 默认`YES`
@property (nonatomic, assign, getter=isEnabledRejectRepeatTap) IBInspectable BOOL enabledRejectRepeatTap;

@end


/// 回调, 按钮的`target`对象遵守该协议即可接收回调事件
@protocol UIButtonRejectRepeatTapGestureCallback <NSObject>

/**
 当重复点击时的回调方法

 @param button 被点击的按钮
 @param timeInterval 两次点击之间的时间间隔
 */
- (void)rejectRepeatTapGestureFromButton:(UIButton *)button timeInterval:(NSTimeInterval)timeInterval;

@end

NS_ASSUME_NONNULL_END
