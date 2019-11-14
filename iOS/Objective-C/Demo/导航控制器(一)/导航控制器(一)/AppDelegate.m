//
//  AppDelegate.m
//  导航控制器(一)
//
//  Created by czm on 2019/11/11.
//  Copyright © 2019 czm. All rights reserved.
//

#import "AppDelegate.h"

#import "UIImage+Extension.h"
#import "ZMNavigationController.h"
#import "OneViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    if (@available(iOS 9.0, *)) {
        self.window.rootViewController = [[UIViewController alloc] init];
    }
    
    [self setupNavigationBar];
    
    OneViewController *v = [[OneViewController alloc] init];
    ZMNavigationController *nav = [[ZMNavigationController alloc] initWithRootViewController:v];
    self.window.rootViewController = nav;
    return YES;
}


- (void)setupNavigationBar {
    
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    // 1、隐藏导航栏下划线
//    UIImage *clear = [UIImage imageWithColor:[UIColor clearColor]];
//    self.navigationBar.shadowImage = clear;
    
    // 2、设置导航栏背景图片
    UIImage *bgImg = [UIImage imageWithColor:[UIColor whiteColor]];
    [navigationBar setBackgroundImage:bgImg forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    
    // 3、修改VC的View从 navigationBar 下方开始布局
    navigationBar.translucent = NO;
    
    // 4、设置导航栏 title 的样式
    navigationBar.titleTextAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize:18], NSForegroundColorAttributeName: [UIColor blackColor]};
    

    // 5、设置返回按钮 titile 和 image 的颜色
    navigationBar.tintColor = [UIColor blackColor];

    // 后退按钮旁边显示的图片，它和backIndicatorTransitionMaskImage配套使用
    navigationBar.backIndicatorImage = [UIImage imageNamed:@"nav_btn_back"];
    // 在 pop 和 push 过渡期间用作内容遮罩的图像
    navigationBar.backIndicatorTransitionMaskImage = [UIImage imageNamed:@"nav_btn_back"];
}


@end
