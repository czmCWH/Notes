//
//  ZMAlertAnimation.m
//  UIView动画
//
//  Created by czm on 2019/11/1.
//  Copyright © 2019 czm. All rights reserved.
//

#import "ZMAlertAnimation.h"

@implementation ZMAlertAnimation

// 动画时间
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.25;
}

// 转场操作
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController * fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIViewController * toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView * container = [transitionContext containerView];
    
    if (toVC.isBeingPresented) {
        UIView * shadow = [[UIView alloc] init];
        shadow.userInteractionEnabled = NO;
        shadow.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.25];
        shadow.alpha = 0.0;
        shadow.translatesAutoresizingMaskIntoConstraints = NO;
        [container addSubview:shadow];
        [self setupShadowConstraint:shadow withView:container];
        
        [container addSubview:toVC.view];
        [container bringSubviewToFront:fromVC.view];
        
        // 动画
        toVC.view.transform = CGAffineTransformMakeScale(1.2, 1.2);
        [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext] delay:0 options:2 animations:^{
            toView.transform = CGAffineTransformIdentity;
            shadow.alpha = 1.0;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }
    
    if (fromVC.isBeingDismissed) {
        [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 options:UIViewAnimationOptionAllowUserInteraction
        animations:^{
    
        }
        completion:^(BOOL finished) {
            [fromView removeFromSuperview];
            [transitionContext completeTransition:YES];
        }];
    }
}

// 设置约束，避免横竖屏，蒙版的frame有问题
- (void)setupShadowConstraint:(UIView *)shadowView withView:(UIView *)forView {
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:shadowView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:forView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:shadowView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:forView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
    
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:shadowView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:forView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    
    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:shadowView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:forView attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
    [forView addConstraints:@[top, left, bottom, right]];
}

@end
