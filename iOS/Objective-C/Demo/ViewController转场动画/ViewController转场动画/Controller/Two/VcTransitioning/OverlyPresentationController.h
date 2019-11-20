//
//  OverlyPresentationController.h
//  ViewController转场动画
//
//  Created by czm on 2019/11/14.
//  Copyright © 2019 czm. All rights reserved.
//
/**
 
 参考Apple文档：https://developer.apple.com/library/archive/featuredarticles/ViewControllerPGforiPhoneOS/DefiningCustomPresentations.html#//apple_ref/doc/uid/TP40007457-CH25-SW1
 
 UIPresentationController 的作用
    1、设置显示的VC的frame
    2、添加自定义的view，以更改呈现内容的外观
    3、为其任何自定义视图提供过渡动画
 */

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OverlyPresentationController : UIPresentationController

@end

NS_ASSUME_NONNULL_END
