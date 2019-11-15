//
//  ZMTabBarController.m
//  UITabBarController的使用
//
//  Created by czm on 2019/11/15.
//  Copyright © 2019 czm. All rights reserved.
//
/**
 参考博客：
 https://www.jianshu.com/p/b3edfa35ee97
 */

#import "ZMTabBarController.h"
#import "UIImage+Extension.h"
#import "UIColor+Extension.h"

#import "ZMNavigationController.h"
#import "ZMTabBar.h"
#import "ZMTabBarControllerDelegate.h"

#import "ZMMainViewController.h"
#import "ZMFindViewController.h"
#import "ZMMineViewController.h"

@interface ZMTabBarController ()<UITabBarDelegate>

@property (nonatomic, strong)ZMTabBarControllerDelegate *tabBarVCDelegate;

@end

@implementation ZMTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupAddChildControllers];
    [self setupTabBar];
    [self setupTabBarItem];
    self.delegate = self.tabBarVCDelegate;
    
    //添加左右滑动手势pan
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [self.view addGestureRecognizer:pan];
}

- (void)setupAddChildControllers {

    NSArray *clsArr = @[@"ZMMain", @"ZMFind", @"ZMMine"];
    for (NSString *cls in clsArr) {
        NSString *clsName = [NSString stringWithFormat:@"%@ViewController", cls];
        Class class = NSClassFromString(clsName);
        ZMBasicViewController *vc = [[class alloc] init];
        ZMNavigationController *nav = [[ZMNavigationController alloc] initWithRootViewController:vc];
        [self addChildViewController:nav];
    }
}

- (void)setupTabBar {
    ZMTabBar *tabBar = [[ZMTabBar alloc] init];
    tabBar.translucent = NO;
    tabBar.backgroundImage = [UIImage imageWithColor:[UIColor whiteColor]];
    tabBar.shadowImage = [UIImage imageWithColor:[[UIColor colorWithHex:0xf2f2f2] colorWithAlphaComponent:0.5]];
    tabBar.delegate = self;
    [self setValue:tabBar forKey:@"tabBar"];
}

- (void)setupTabBarItem {
    
    NSArray <NSString *>*titles = @[@"首页", @"发现", @"我的"];
    NSArray <NSString *>*norImg = @[@"icon_tab_home_nor", @"icon_tab_more_nor", @"icon_tab_my_nor"];
    NSArray <NSString *>*selImg = @[@"icon_tab_home_pre", @"icon_tab_more_pre", @"icon_tab_my_pre"];
    
    NSDictionary *norTextAttri = @{NSForegroundColorAttributeName:[UIColor grayColor], NSFontAttributeName: [UIFont systemFontOfSize:10]};
    NSDictionary *selTextAttri = @{NSForegroundColorAttributeName:[UIColor blackColor], NSFontAttributeName: [UIFont systemFontOfSize:10]};
    
    [self.childViewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull vc, NSUInteger idx, BOOL * _Nonnull stop) {
        vc.tabBarItem.title = titles[idx];
        vc.tabBarItem.image = [UIImage imageOriginalNamed:norImg[idx]];
        vc.tabBarItem.selectedImage = [UIImage imageOriginalNamed:selImg[idx]];
        [vc.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -1)];
        [vc.tabBarItem setTitleTextAttributes:norTextAttri forState:UIControlStateNormal];
        [vc.tabBarItem setTitleTextAttributes:selTextAttri forState:UIControlStateSelected];
    }];
}

#pragma mark - UITabBarDelegate
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    NSInteger idx = [self.tabBar.items indexOfObject:item];
    int i = 0;
    
    CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    //设置动画属性
    basic.fromValue = @1;  //从几倍开始
    basic.toValue = @1.2;  //缩放到几倍
    basic.duration = 1;    //动画时间
    basic.repeatCount = 1; //重复次数
    basic.speed = 5;       //速度
    basic.beginTime = CACurrentMediaTime();   //延迟时间
    //恢复时也有动画效果  默认为NO
    basic.autoreverses = YES;
    
    for (UIView *v in tabBar.subviews) {
        if ([v isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if (i == idx) {
                 [v.layer addAnimation:basic forKey:nil];
                return;
            }
            i += 1;
        }
    }
}

- (void)handlePan:(UIPanGestureRecognizer *)recongizer {
    
}

- (ZMTabBarControllerDelegate *)tabBarVCDelegate {
    if (_tabBarVCDelegate == nil) {
        _tabBarVCDelegate = [[ZMTabBarControllerDelegate alloc] init];
    }
    return _tabBarVCDelegate;
}

@end
