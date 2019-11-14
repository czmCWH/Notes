//
//  UIImage+Extension.h
//  导航控制器(一)
//
//  Created by czm on 2019/11/11.
//  Copyright © 2019 czm. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Extension)

#pragma mark 根据颜色获取图片
+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
