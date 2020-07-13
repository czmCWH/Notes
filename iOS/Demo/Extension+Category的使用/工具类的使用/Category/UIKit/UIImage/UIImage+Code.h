//
//  UIImage+Code.h
//  工具类的使用
//
//  Created by czm on 2019/11/7.
//  Copyright © 2019 czm. All rights reserved.
//

/*  二维码和条形码的生成  */

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Code)

/*生成二维码(黑白色)*/
+ (UIImage *)getQRWithString:(NSString *)string size:(CGFloat)size;

/*生成二维码(前景色)*/
+ (UIImage *)getQRWithString:(NSString *)string size:(CGFloat)size foreColor:(UIColor *)foreColor;

/*生成二维码(前景色、logo、logo的圆角大小)*/
+ (UIImage *)getQRWithString:(NSString *)string size:(CGFloat)size foreColor:(UIColor *)foreColor logoImage:(UIImage *)logo logoRadius:(CGFloat)radius;

/* 生成线性渐变二维码(渐变颜色数组)*/
+ (UIImage *)getLineGradientQRWithString:(NSString *)string size:(CGFloat)size gradientColor:(NSArray<UIColor *>*)colors;

/* 生成线性渐变二维码(渐变颜色数组、logo、logo的圆角大小)*/
+ (UIImage *)getLineGradientQRWithString:(NSString *)string size:(CGFloat)size gradientColor:(NSArray<UIColor *>*)colors logoImage:(UIImage *)logo logoRadius:(CGFloat)radius;

/* 生成圆形渐变二维码(渐变颜色数组)*/
+ (UIImage *)getRoundGradientQRWithString:(NSString *)string size:(CGFloat)size gradientColor:(NSArray<UIColor *>*)colors;

/* 生成圆形渐变二维码(渐变颜色数组、logo、logo的圆角大小)*/
+ (UIImage *)getRoundGradientQRWithString:(NSString *)string size:(CGFloat)size gradientColor:(NSArray<UIColor *>*)colors logoImage:(UIImage *)logo logoRadius:(CGFloat)radius;

/* 生成条形码*(iOS8.0以上适用)*/
+ (UIImage *)getBarWithString:(NSString *)string size:(CGSize)size;




@end

NS_ASSUME_NONNULL_END
