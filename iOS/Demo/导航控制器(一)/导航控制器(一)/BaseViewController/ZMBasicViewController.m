//
//  ZMBasicViewController.m
//  导航控制器(一)
//
//  Created by czm on 2019/11/11.
//  Copyright © 2019 czm. All rights reserved.
//

#import "ZMBasicViewController.h"

#import "UIImage+Extension.h"

@interface ZMBasicViewController ()<UIGestureRecognizerDelegate>

@end

@implementation ZMBasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1、侧滑返回
    [self setPopGesture];
    
    // 2、设置默认返回title
    // 系统会忽略 backBarButtonItem 绑定的事件，UINavigatonController自动为其绑定事件，只做POP动作。
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:nil];
}

- (void)setPopGesture {
    // 1、设置侧滑手势
    self.allowPopGesture = YES;
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

#pragma mark - public
- (void)setBackTitle:(NSString *)backTitle backImage:(UIImage *)backImg tintColor:(UIColor *)tintColor {
    if (!backTitle) backTitle = @"返回";
    if (!backImg) backImg = [UIImage imageNamed:@"nav_btn_back"];
    if (!tintColor) [UIColor blackColor];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:backTitle style:UIBarButtonItemStylePlain target:self action:nil];
    
    self.navigationController.navigationBar.tintColor = tintColor;

    // 后退按钮旁边显示的图片，它和backIndicatorTransitionMaskImage配套使用
    self.navigationController.navigationBar.backIndicatorImage = backImg;
    // 在 pop 和 push 过渡期间用作内容遮罩的图像
    self.navigationController.navigationBar.backIndicatorTransitionMaskImage = backImg;
}

- (void)backButtonDefault {
    [self setBackTitle:nil backImage:nil tintColor:nil];
}

- (void)observeBackToVc {
    // 实现自己的返回逻辑
    // ... do something private
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)hiddenNavigationBar:(BOOL)isHidden {
    [self.navigationController setNavigationBarHidden:isHidden animated:YES];
}

- (void)setNavigationBarAlpha:(BOOL)alpha {
    UIImage *bgImg = [UIImage imageWithColor:[[UIColor whiteColor] colorWithAlphaComponent:alpha]];
    [self.navigationController.navigationBar setBackgroundImage:bgImg forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.translucent = YES;
}

#pragma mark - setters
- (void)setAllowPopGesture:(BOOL)allowPopGesture {
    _allowPopGesture = allowPopGesture;
    self.navigationController.interactivePopGestureRecognizer.enabled = allowPopGesture;
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    return YES;
}

@end
