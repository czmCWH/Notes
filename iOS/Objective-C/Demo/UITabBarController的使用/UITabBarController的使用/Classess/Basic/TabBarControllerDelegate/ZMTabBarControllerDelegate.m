//
//  ZMTabBarControllerDelegate.m
//  UITabBarController的使用
//
//  Created by czm on 2019/11/15.
//  Copyright © 2019 czm. All rights reserved.
//

#import "ZMTabBarControllerDelegate.h"
#import "ZMTabBarInteractiveTransitioning.h"
#import "ZMTabBarAnimatedTransitioning.h"

@interface ZMTabBarControllerDelegate ()



@end

@implementation ZMTabBarControllerDelegate

- (instancetype)init {
    if (self = [super init]) {
        self.interactive = NO;
        self.interactiveTransition = [[UIPercentDrivenInteractiveTransition alloc] init];
    }
    return self;
}

#pragma mark - UITabBarControllerDelegate
//- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController API_AVAILABLE(ios(3.0));
//- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController;

- (void)tabBarController:(UITabBarController *)tabBarController willBeginCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers {
    
}
- (void)tabBarController:(UITabBarController *)tabBarController willEndCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers changed:(BOOL)changed {
    
}

- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers changed:(BOOL)changed {
    
}

/// 返回标签栏控制器支持的界面方向。
/// @param tabBarController 标签栏控制器
- (UIInterfaceOrientationMask)tabBarControllerSupportedInterfaceOrientations:(UITabBarController *)tabBarController {
    return UIInterfaceOrientationMaskAll;
}

/// 返回呈现标签栏控制器的首选方向
/// @param tabBarController 标签栏控制器
- (UIInterfaceOrientation)tabBarControllerPreferredInterfaceOrientationForPresentation:(UITabBarController *)tabBarController {
    return UIInterfaceOrientationPortrait;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)tabBarController:(UITabBarController *)tabBarController
interactionControllerForAnimationController: (id <UIViewControllerAnimatedTransitioning>)animationController {
    return self.interactive ? self.interactiveTransition : nil;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController
            animationControllerForTransitionFromViewController:(UIViewController *)fromVC
toViewController:(UIViewController *)toVC {
    
    if (self.interactive) {
        NSInteger fromIndx = [tabBarController.viewControllers indexOfObject:fromVC];
        NSInteger toIndx = [tabBarController.viewControllers indexOfObject:toVC];
        
        // 获取转场的方向
        TabBarVcChangeDirection direction = toIndx < fromIndx ? TabBarVcChangeDirectionLeft : TabBarVcChangeDirectionRight;
        
        return [[ZMTabBarAnimatedTransitioning alloc] initWithDirection:direction];
    } else {
        return nil;
    }
}

@end
