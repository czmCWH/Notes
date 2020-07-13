//
//  AnimatedTransitioning.m
//  ViewController转场动画
//
//  Created by czm on 2019/11/14.
//  Copyright © 2019 czm. All rights reserved.
//

#import "AnimatedTransitioning.h"
#import "UIView+Extension.h"

@implementation AnimatedTransitioning


- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 1.5;
}


- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIView *containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    UIViewController *fromVc = [transitionContext
            viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVc   = [transitionContext
            viewControllerForKey:UITransitionContextToViewControllerKey];
 
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
 
    
    CGRect containerFrame = containerView.frame;
    CGRect toViewStartFrame = [transitionContext initialFrameForViewController:toVc];
    CGRect toViewFinalFrame = [transitionContext finalFrameForViewController:toVc];
    CGRect fromViewFinalFrame = [transitionContext finalFrameForViewController:fromVc];
    
    NSLog(@"============ %@, %@, %@ \n", NSStringFromCGRect(containerFrame),  NSStringFromCGRect(toViewFinalFrame), NSStringFromCGRect(fromViewFinalFrame));
    
    if (toVc.isBeingPresented) {
        toViewStartFrame.origin.x = containerFrame.size.width;
        toViewStartFrame.origin.y = containerFrame.size.height;
    }
    
    [containerView addSubview:toView];
    toView.frame = toViewStartFrame;
    
    if (toVc.isBeingPresented) {
        [UIView animateWithDuration:duration animations:^{
            
            toView.frame = toViewFinalFrame;

        } completion:^(BOOL finished) {
            // 告诉UIKit过渡已完成，并且用户可以开始使用显示的视图控制器
            BOOL success = ![transitionContext transitionWasCancelled];
            [transitionContext completeTransition:success];
        }];
    }
    
    if (fromVc.isBeingDismissed) {
        [UIView animateWithDuration:duration animations:^{
            
            fromView.frame = CGRectMake(containerView.width, containerView.height, 0, 0);
            
        } completion:^(BOOL finished) {
            BOOL success = ![transitionContext transitionWasCancelled];
            [toView removeFromSuperview];
            // 告诉UIKit过渡已完成，并且用户可以开始使用显示的视图控制器
            [transitionContext completeTransition:success];
        }];
    }
    
}

@end
