//
//  ZMTabBarAnimatedTransitioning.m
//  UITabBarController的使用
//
//  Created by czm on 2019/11/15.
//  Copyright © 2019 czm. All rights reserved.
//

#import "ZMTabBarAnimatedTransitioning.h"

@interface ZMTabBarAnimatedTransitioning ()

@property (nonatomic, assign)TabBarVcChangeDirection changeDirection;

@end

@implementation ZMTabBarAnimatedTransitioning

- (instancetype)initWithDirection:(TabBarVcChangeDirection)direction {
    if (self = [super init]) {
        self.changeDirection = direction;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.25;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
//    UIViewController *fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
//    UIViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    [containerView addSubview:toView];
    
    CGFloat translation = containerView.frame.size.width;
    CGAffineTransform toViewTransform = CGAffineTransformIdentity;
    CGAffineTransform fromViewTransform = CGAffineTransformIdentity;
    
    translation = self.changeDirection == TabBarVcChangeDirectionRight ? -translation : translation;
    fromViewTransform = CGAffineTransformMakeTranslation(translation, 0);
    toViewTransform = CGAffineTransformMakeTranslation(-translation, 0);
    
    toView.transform = toViewTransform;
    
    [UIView animateWithDuration:duration animations:^{
        fromView.transform = fromViewTransform;
        toView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        
        fromView.transform = CGAffineTransformIdentity;
        toView.transform = CGAffineTransformIdentity;
        BOOL result = !transitionContext.transitionWasCancelled;
        [transitionContext completeTransition:result];
    }];
}

@end
