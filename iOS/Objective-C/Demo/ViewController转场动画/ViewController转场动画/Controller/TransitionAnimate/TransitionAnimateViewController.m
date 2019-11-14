//
//  TransitionAnimateViewController.m
//  ViewController转场动画
//
//  Created by czm on 2019/11/13.
//  Copyright © 2019 czm. All rights reserved.
//

#import "TransitionAnimateViewController.h"
#import "AnimatedTransitioningObject.h"
#import "InteractiveTransitioningObject.h"

@interface TransitionAnimateViewController ()

@end

@implementation TransitionAnimateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - UINavigationControllerDelegate
#pragma mark 响应显示的视图控制器
/// 将要展示 UIViewController的view 以及 navigationItem 属性之前调用
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
}

// 展示了UIViewController的view 以及 navigationItem 属性之后调用
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
}

#pragma mark 支持自定义过渡动画
/// 返回一个 非交互式 的animator对象，以便在视图控制器转换期间使用，即进行 pop  或者 push 操作时。
/// @param navigationController 导航堆栈正在更改的导航控制器
/// @param operation 发生的过渡操作的类型
/// @param fromVC 当前可见的视图控制器
/// @param toVC 转换结束时应该可见的视图控制器
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    
    // 返回一个遵守 UIViewControllerAnimatedTransitioning 协议的对象，该对象用来进行过渡动画
    // 如果返回为nil，则使用系统自带的过渡动画
//    return nil;
    if (operation == UINavigationControllerOperationPush) {
        return [[AnimatedTransitioningObject alloc] init];
    }
    
    return nil;
}

/// 返回交互式动画对象，以便在视图控制器转换期间使用。
/// @param navigationController 正在更改其导航堆栈的导航控制器
/// @param animationController 由 navigationController：animationControllerForOperation：fromViewController：toViewController：提供的 非交互式 动画对象
- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    
    // 返回一个遵守 UIViewControllerInteractiveTransitioning 协议的对象，该对象负责管理过渡动画的动画对象
    // 如果返回为nil，则使用标准导航控制器过渡
    
    return nil;
}


/// 返回导航控制器的首选显示方向
/// @param navigationController 导航控制器
- (UIInterfaceOrientation)navigationControllerPreferredInterfaceOrientationForPresentation:(UINavigationController *)navigationController {
    return UIInterfaceOrientationLandscapeLeft;
}

/// 导航控制器支持的界面方向的完整集合
/// @param navigationController  导航控制器
- (UIInterfaceOrientationMask)navigationControllerSupportedInterfaceOrientations:(UINavigationController *)navigationController {
    return UIInterfaceOrientationMaskLandscapeLeft;
}

@end
