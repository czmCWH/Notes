//
//  ZMModalTransitionDelegate.m
//  ViewController转场动画
//
//  Created by czm on 2019/11/14.
//  Copyright © 2019 czm. All rights reserved.
//

#import "ZMModalTransitionDelegate.h"

#import "AnimatedTransitioning.h"
#import "InteractiveTransitioning.h"

#import "OverlyPresentationController.h"

@implementation ZMModalTransitionDelegate

#pragma mark - UIViewControllerTransitioningDelegate
/// 返回模态显示VC时使用的动画对象，如果返回nil，则使用默认的过渡动画
/// @param presented 即将显示的VC
/// @param presenting 显示视图控制器的视图控制器，可以是window、navigationController、或者和source相同
/// @param source 调用了presentViewController：animated：completion：方法的视图控制器
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [[AnimatedTransitioning alloc] init];
}

/// 返回dismiss时使用的动画对象，如果返回nil，则不会有动画效果
/// @param dismissed 即将要被dismiss的ViewController
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[AnimatedTransitioning alloc] init];
}

//- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator {
//
//    return [[InteractiveTransitioning alloc] init];
//}
//
//- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator {
//
//    return [[InteractiveTransitioning alloc] init];
//}

/// 返回一个用于管理过渡动画和屏幕上视图控制器的呈现VC
/// @param presented 显示的视图控制器
/// @param presenting 用来显示视图控制器的视图控制器
/// @param source <#source description#>
- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(nullable UIViewController *)presenting sourceViewController:(UIViewController *)source {

    return [[OverlyPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
}

@end
