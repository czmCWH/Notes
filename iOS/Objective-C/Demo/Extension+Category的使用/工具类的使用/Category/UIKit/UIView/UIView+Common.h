//
//  UIView+Common.h
//  工具类的使用
//
//  Created by czm on 2019/11/7.
//  Copyright © 2019 czm. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Common)

//获取view所在的ViewController
- (UIViewController *)viewController;

//获取view所在的ViewController的name
- (NSString *)viewControllerName;

//通过名称获取nib
+ (UINib *)nibWithName:(NSString *)name;

//通过NIb名称获取内部View视图集合
+ (NSArray *)viewsWithNibName:(NSString *)name;

//设置圆角 (圆角大小 圆角宽度 圆角颜色)
- (void)setCornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

@end

NS_ASSUME_NONNULL_END
