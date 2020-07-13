//
//  ZMBaseViewController.h
//  ViewController转场动画
//
//  Created by czm on 2019/11/13.
//  Copyright © 2019 czm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+Extension.h"
#import "UIView+Extension.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZMBaseViewController : UIViewController

/// 是否可以侧滑返回，默认值为 YES
@property (nonatomic, assign) BOOL allowPopGesture;

/// 设置 push 到 VC 的返回按钮
/// @param backTitle 返回按钮标题
/// @param backImg 返回按钮图片
/// @param tintColor 返回按钮 title img  的渲染颜色
- (void)setBackTitle:(NSString * __nullable)backTitle backImage:(UIImage * __nullable)backImg tintColor:(UIColor * __nullable)tintColor;

/// 使用默认自定义的返回按钮，用恢复修改后的情况
- (void)backButtonDefault;

/// 监听返回事件，包括侧滑返回
#warning 暂时没找到如何监听的好方法
- (void)observeBackToVc;

/// 是否隐藏导航栏
/// @param isHidden 为YES表示隐藏
- (void)hiddenNavigationBar:(BOOL)isHidden;

/// 设置导航栏不透明度
/// @param alpha 取值范围 0～1.0
- (void)setNavigationBarAlpha:(BOOL)alpha;

@end

NS_ASSUME_NONNULL_END
