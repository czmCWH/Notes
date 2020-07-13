//
//  ZMNavigationController.m
//  ViewController转场动画
//
//  Created by czm on 2019/11/13.
//  Copyright © 2019 czm. All rights reserved.
//

#import "ZMNavigationController.h"
#import "ZMBaseViewController.h"

#import "UIImage+Extension.h"

@interface ZMNavigationController ()<UINavigationBarDelegate, UINavigationControllerDelegate>

@end

@implementation ZMNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.delegate = self;
    [self setupNavigationBar];
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

/// 将要展示一个UIViewController
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
}

// 已经展示一个UIViewController
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
}

// 提供自定义非交互式过渡动画
/*
* 参数一: UINavigationController
* 参数二: UINavigationControllerOperation, 可选项为UINavigationControllerOperationNone(无操作), UINavigationControllerOperationPush(Push操作), UINavigationControllerOperationPop(Pop操作)
* 参数三: UIViewController, 当前可见视图控制器
* 参数四: UIViewController, 动画结束后可见视图控制器
* 返回值: 实现了UIViewControllerAnimatedTransitioning协议的NSObject对象
*/
//- (UIInterfaceOrientationMask)navigationControllerSupportedInterfaceOrientations:(UINavigationController *)navigationController {
//
//}

//提供自定义交互式过渡动画
// 方法
/*
 * 参数一: UINavigationController
 * 参数二: 由navigationController:animationControllerForOperation:fromViewController:toViewController:代理方法提供的实现了UIViewControllerAnimatedTransitioning协议的NSObject对象
 * 返回值: 实现了UIViewControllerInteractiveTransitioning协议的NSObject对象
 */
//- (UIInterfaceOrientation)navigationControllerPreferredInterfaceOrientationForPresentation:(UINavigationController *)navigationController {
//
//}
//
//- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
//                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController {
//
//}
//
//- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
//                                   animationControllerForOperation:(UINavigationControllerOperation)operation
//                                                fromViewController:(UIViewController *)fromVC
//                                                           toViewController:(UIViewController *)toVC  {
//
//}

- (BOOL)hidesBottomBarWhenPushed {
    return YES;
}

@end
