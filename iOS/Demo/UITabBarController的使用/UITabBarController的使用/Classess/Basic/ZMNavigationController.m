//
//  ZMNavigationController.m
//  UITabBarController的使用
//
//  Created by czm on 2019/11/15.
//  Copyright © 2019 czm. All rights reserved.
//

#import "ZMNavigationController.h"
#import "UIImage+Extension.h"

@interface ZMNavigationController ()

@end

@implementation ZMNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavigationBar];
}

- (void)setupNavigationBar {
    // 1、隐藏导航栏下划线
//    UIImage *clear = [UIImage imageWithColor:[UIColor clearColor]];
//    self.navigationBar.shadowImage = clear;
    
    // 2、设置导航栏背景图片
    UIImage *bgImg = [UIImage imageWithColor:[UIColor whiteColor]];
    [self.navigationBar setBackgroundImage:bgImg forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    
    // 3、修改VC的View从 navigationBar 下方开始布局
    self.navigationBar.translucent = NO;
    
    // 4、设置导航栏 title 的样式
    self.navigationBar.titleTextAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize:18], NSForegroundColorAttributeName: [UIColor blackColor]};
    

    // 5、设置返回按钮 titile 和 image 的颜色
    self.navigationBar.tintColor = [UIColor blackColor];

    // 后退按钮旁边显示的图片，它和backIndicatorTransitionMaskImage配套使用
    self.navigationBar.backIndicatorImage = [UIImage imageOriginalNamed:@"nav_btn_back"];
    // 在 pop 和 push 过渡期间用作内容遮罩的图像
    self.navigationBar.backIndicatorTransitionMaskImage = [UIImage imageOriginalNamed:@"nav_btn_back"];
}


@end
