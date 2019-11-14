//
//  UIImage+Extension.m
//  导航控制器(一)
//
//  Created by czm on 2019/11/11.
//  Copyright © 2019 czm. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

#pragma mark 根据颜色获取图片
+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
