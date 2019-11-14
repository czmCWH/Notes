//
//  AnimatedTransitioningObject.m
//  ViewController转场动画
//
//  Created by czm on 2019/11/13.
//  Copyright © 2019 czm. All rights reserved.
//

#import "AnimatedTransitioningObject.h"

@implementation AnimatedTransitioningObject

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 2;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    // 不能直接通过VC操作View，而要通过 viewForKey：来获取
    UIViewController *fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    [containerView addSubview:toView];
    
    // 设置view的frame动画效果
    [UIView animateWithDuration:2 animations:^{
        
        toView.transform = CGAffineTransformMakeScale(1.2, 1.2);
//        fromView.alpha = 0.0;
        
    } completion:^(BOOL finished) {
        toView.transform = CGAffineTransformIdentity;
//        fromView.alpha = 1.0;
        // 提交transion完成
        [transitionContext completeTransition:YES];
    }];
}

@end
