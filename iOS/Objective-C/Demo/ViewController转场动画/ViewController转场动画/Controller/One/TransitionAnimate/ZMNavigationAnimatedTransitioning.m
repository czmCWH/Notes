//
//  ZMNavigationAnimatedTransitioning.m
//  ViewController转场动画
//
//  Created by czm on 2019/11/20.
//  Copyright © 2019 czm. All rights reserved.
//

#import "ZMNavigationAnimatedTransitioning.h"
#import "UIView+Extension.h"

@interface ZMNavigationAnimatedTransitioning ()

@property (nonatomic, assign)UINavigationControllerOperation operation;

@end

@implementation ZMNavigationAnimatedTransitioning

- (instancetype)initWithType:(UINavigationControllerOperation)operation {
    if (self = [super init]) {
        self.operation = operation;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
//    return 0.25;
    return 2;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    // 不能直接通过VC操作View，而要通过 viewForKey：来获取
    UIView *containerView = [transitionContext containerView];
    UIViewController *fromVc = [transitionContext
                                viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVc = [transitionContext
                                viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    CGRect containerFrame = containerView.frame;
    CGRect toViewStartFrame = [transitionContext initialFrameForViewController:toVc];
    CGRect toViewFinalFrame = [transitionContext finalFrameForViewController:toVc];
    CGRect fromViewFinalFrame = [transitionContext finalFrameForViewController:fromVc];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    if (self.operation == UINavigationControllerOperationPush) {
        [containerView addSubview:toView];
        fromView.x = 0;
        toView.x = -containerFrame.size.width;
        // 设置view的frame动画效果
        [UIView animateWithDuration:duration animations:^{
            toView.x = 0;
            fromView.x = containerFrame.size.width;
        } completion:^(BOOL finished) {
            fromView.frame = fromViewFinalFrame;
            toView.frame = toViewFinalFrame;
            // 告诉UIKit过渡已完成，并且用户可以开始使用显示的视图控制器
            BOOL success = ![transitionContext transitionWasCancelled];
            [transitionContext completeTransition:success];
        }];
    }
    
    if (self.operation == UINavigationControllerOperationPop) {
        //将toView加到fromView的下面，非常重要！！！
        [[transitionContext containerView] insertSubview:toView belowSubview:fromView];
        
        // 设置view的frame动画效果
        toView.x = containerFrame.size.width;
        [UIView animateWithDuration:duration animations:^{
            fromView.x = -containerFrame.size.width;
            toView.x = 0;
        } completion:^(BOOL finished) {
            // 告诉UIKit过渡已完成，并且用户可以开始使用显示的视图控制器
            BOOL success = ![transitionContext transitionWasCancelled];
            [transitionContext completeTransition:success];
        }];
    }
}

@end
