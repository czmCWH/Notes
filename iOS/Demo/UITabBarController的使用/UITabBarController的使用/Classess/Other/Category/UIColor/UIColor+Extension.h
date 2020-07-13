//
//  UIColor+Extension.h
//  UITabBarController的使用
//
//  Created by czm on 2019/11/15.
//  Copyright © 2019 czm. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Extension)

/** 使用 16 进制数字创建颜色，例如 0xFF0000 创建红色
 *  param1: 16 进制无符号32位整数
 *  return: 颜色
 */
+ (instancetype)colorWithHex:(uint32_t)hex;

/** 生成16进制的透明度颜色 */
+ (instancetype)colorWithHex:(uint32_t)hex alpha:(CGFloat)alpha;

/** 生成随机颜色  */
+ (instancetype)randomColor;


/** 使用 R / G / B 数值创建颜色  */
+ (instancetype)colorWithRed:(uint8_t)red green:(uint8_t)green blue:(uint8_t)blue;

@end

NS_ASSUME_NONNULL_END
