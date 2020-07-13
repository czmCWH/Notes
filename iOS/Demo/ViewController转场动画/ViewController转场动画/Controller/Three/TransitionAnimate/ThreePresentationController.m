//
//  ThreePresentationController.m
//  ViewController转场动画
//
//  Created by czm on 2019/11/19.
//  Copyright © 2019 czm. All rights reserved.
//

#import "ThreePresentationController.h"
#import "UIView+Extension.h"

@interface ThreePresentationController ()

@property (nonatomic, strong)UIView *dimmingView;

@end

@implementation ThreePresentationController

- (instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController {
    
    if (self = [super initWithPresentedViewController:presentedViewController presentingViewController:presentingViewController]) {
        [self createUI];
    }
    return self;
}

// 在此方法中创建UI
- (void)createUI {
    _dimmingView = [[UIView alloc] init];
    _dimmingView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.4];
}

// 为自定义视图添加动画
- (void)presentationTransitionWillBegin {
    UIView *containerView = [self containerView];
    UIViewController *presentedViewController = [self presentedViewController];
    
    self.dimmingView.frame =containerView.bounds;
    self.dimmingView.alpha = 0.0;
    
    [containerView insertSubview:self.dimmingView atIndex:0];
    
    if ([presentedViewController transitionCoordinator]) {
        [[presentedViewController transitionCoordinator] animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
            self.dimmingView.alpha = 1.0;
        } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
            
        }];
    } else {
        self.dimmingView.alpha = 1.0;
    }
}

/// 当动画取消时，进行清理相关的自定义View
/// @param completed 返回NO，表示取消过渡
- (void)presentationTransitionDidEnd:(BOOL)completed {
    if (!completed) {
        [self.dimmingView removeFromSuperview];
    }
}

/// 即将dismiss视图控制器，通过此方法添加消失动画
- (void)dismissalTransitionWillBegin {
    
    if ([self presentedViewController]) {
        [self.presentedViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
            self.dimmingView.alpha = 0.0;
        } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
            self.dimmingView.alpha = 0.0;
        }];
    } else {
        self.dimmingView.alpha = 0.0;
    }
}

/// dismiss成功会调用此方法，删除自定义的view
/// @param completed YES表示成功
- (void)dismissalTransitionDidEnd:(BOOL)completed {
    if (completed) {
        [self.dimmingView removeFromSuperview];
    }
}

/// 当动画结束时，返回给 presented VC 的 frame
- (CGRect)frameOfPresentedViewInContainerView {
    CGFloat width = self.containerView.width;
    CGFloat height = self.containerView.height;
    CGFloat W = width * 2/3;
    CGFloat H = height * 2/3;
    return CGRectMake((width - W)*0.5, (height - H)*0.5, W, H);
}

@end
