//
//  ZMAlertViewController.m
//  UIView动画
//
//  Created by czm on 2019/10/31.
//  Copyright © 2019 czm. All rights reserved.
//

#import "ZMAlertViewController.h"
#import "ZMAlertAnimation.h"


#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height

@interface ZMAlertViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation ZMAlertViewController

- (instancetype)init {
    if (self = [super init]) {
        self.transitioningDelegate = self;
        self.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        // 模态显示的样式：全屏 or 自定义
        self.modalPresentationStyle = UIModalPresentationCustom;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createUI];
}

// 创建UI
- (void)createUI {
    
}

// 设置约束
- (void)setupConstraints {
    
}

- (void)viewWillLayoutSubviews {
    self.view.frame = CGRectMake((ScreenW - 200)*0.5, (ScreenH - 100)*0.5, 200, 100);
    [self setupConstraints];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIViewControllerTransitioningDelegate
//返回用于present的自定义transition动画。
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    return [[ZMAlertAnimation alloc] init];
}

//返回用于dismiss时的自定义transition动画。
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[ZMAlertAnimation alloc] init];
}

@end
