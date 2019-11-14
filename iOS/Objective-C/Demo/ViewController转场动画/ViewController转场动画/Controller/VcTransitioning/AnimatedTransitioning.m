//
//  AnimatedTransitioning.m
//  ViewController转场动画
//
//  Created by czm on 2019/11/14.
//  Copyright © 2019 czm. All rights reserved.
//

#import "AnimatedTransitioning.h"

@implementation AnimatedTransitioning


- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 1.5;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    
    if (toVc.isBeingPresented) {
        [containerView addSubview:toView];
        
        UIView *dimmingView = [[UIView alloc] init];
        [containerView insertSubview:dimmingView belowSubview:toView];
        
        CGFloat toW = containerView.frame.size.width * 2/3;
        CGFloat toH = containerView.frame.size.height * 2/3;
        
        toView.center = containerView.center;
        toView.bounds = CGRectMake(0, 0, 1, toH);
        
        dimmingView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.25];
        dimmingView.center = containerView.center;
        dimmingView.bounds = CGRectMake(0, 0, toW, toH);
        
        [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            toView.bounds = CGRectMake(0, 0, toW, toH);
            dimmingView.bounds = containerView.bounds;
        } completion:^(BOOL finished) {
            BOOL result = !transitionContext.transitionWasCancelled;
            [transitionContext completeTransition:result];
        }];
        
        
    }
    
    if (fromVc.isBeingDismissed) {
        CGFloat fromH = fromView.frame.size.height;
        [UIView animateWithDuration:duration animations:^{
            fromView.bounds = CGRectMake(0, 0, 1, fromH);
        } completion:^(BOOL finished) {
            BOOL result = !transitionContext.transitionWasCancelled;
            [transitionContext completeTransition:result];
        }];
    }
    
}

//- (id <UIViewImplicitlyAnimating>) interruptibleAnimatorForTransition:(id <UIViewControllerContextTransitioning>)transitionContext API_AVAILABLE(ios(10.0)) {
//    
//}

//- (void)animationEnded:(BOOL) transitionCompleted;

@end
