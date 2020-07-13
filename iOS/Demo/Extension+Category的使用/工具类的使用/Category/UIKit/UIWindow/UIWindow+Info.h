//
//  UIWindow+Info.h
//  工具类的使用
//
//  Created by czm on 2019/11/7.
//  Copyright © 2019 czm. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIWindow (Info)

//获取当前屏幕中present出来的viewcontroller。
+ (UIViewController *)getCurrentPresentedVC;

//获取当前屏幕显示的viewcontroller
+ (UIViewController *)getCurrentVC;

@end

NS_ASSUME_NONNULL_END
