//
//  ZMNavigationController.m
//  导航控制器(一)
//
//  Created by czm on 2019/11/11.
//  Copyright © 2019 czm. All rights reserved.
//

#import "ZMNavigationController.h"
#import "ZMBasicViewController.h"

#import "UIImage+Extension.h"

@interface ZMNavigationController ()<UINavigationBarDelegate, UINavigationControllerDelegate>

@end

@implementation ZMNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
//    [self setupNavigationBar];
}

- (void)setupNavigationBar {
    // 1、隐藏导航栏下划线
//    UIImage *clear = [UIImage imageWithColor:[UIColor clearColor]];
//    self.navigationBar.shadowImage = clear;
    
    // 2、设置导航栏背景图片
    UIImage *bgImg = [UIImage imageWithColor:[UIColor whiteColor]];
    [self.navigationBar setBackgroundImage:bgImg forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    
    // 3、修改VC的View从 navigationBar 下方开始布局
    self.navigationBar.translucent = NO;
    
    // 4、设置导航栏 title 的样式
    self.navigationBar.titleTextAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize:18], NSForegroundColorAttributeName: [UIColor blackColor]};
    

    // 5、设置返回按钮 titile 和 image 的颜色
    self.navigationBar.tintColor = [UIColor blackColor];

    // 后退按钮旁边显示的图片，它和backIndicatorTransitionMaskImage配套使用
    self.navigationBar.backIndicatorImage = [UIImage imageNamed:@"nav_btn_back"];
    // 在 pop 和 push 过渡期间用作内容遮罩的图像
    self.navigationBar.backIndicatorTransitionMaskImage = [UIImage imageNamed:@"nav_btn_back"];
}

#pragma mark - UINavigationBarDelegate
// item将要push的时候调用，返回NO，则不能push
//- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPushItem:(UINavigationItem *)item {
//    return YES;
//}

// 在 push animation 结束时调用，如果没有动画则立即调用
//- (void)navigationBar:(UINavigationBar *)navigationBar didPushItem:(UINavigationItem *)item {
//
//}

// item将要pop时调用，返回NO，不能pop
//- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item {
//
//    // https://www.jianshu.com/p/599aa9c9dddd
//https://www.jianshu.com/p/a502d363c998
//
//    UIViewController *vc = self.topViewController;
//   if([vc respondsToSelector:@selector(observeBackToVc)]){
//       [vc performSelector:@selector(observeBackToVc)];
//   }
//    return YES;
//}

// 在 pop animation 结束时调用，如果没有动画则立即调用
//- (void)navigationBar:(UINavigationBar *)navigationBar didPopItem:(UINavigationItem *)item {
//
//}

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
    return UIInterfaceOrientationPortrait;
}

/// 导航控制器支持的界面方向的完整集合
/// @param navigationController  导航控制器
- (UIInterfaceOrientationMask)navigationControllerSupportedInterfaceOrientations:(UINavigationController *)navigationController {
    return UIInterfaceOrientationMaskAll;
}

- (BOOL)hidesBottomBarWhenPushed {
    return YES;
}

@end
