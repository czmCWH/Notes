//
//  ZMAlertWindowController.m
//  自定义Alert弹框
//
//  Created by czm on 2019/11/1.
//  Copyright © 2019 czm. All rights reserved.
//

#import "ZMAlertWindowController.h"

@interface ZMAlertWindowController ()

@property (nonatomic, weak)UIViewController *fromController;

@property (nonatomic, strong)UIView *maskView;          //蒙版view
@property (nonatomic, strong)UIView *alertView;         //弹框view

@end

// 用专门的 window 来显示VC
static UIWindow *alertWindow;

@implementation ZMAlertWindowController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createViews];
    
}
#pragma mark - Views Network
- (void)createViews {
    
    [self.view addSubview:self.maskView];
    [self.view addSubview:self.alertView];

}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    CGFloat widt = [UIScreen mainScreen].bounds.size.width;
    CGFloat heig = [UIScreen mainScreen].bounds.size.height;
    
    self.maskView.frame = CGRectMake(0, 0, widt, heig);
    self.alertView.frame = CGRectMake((widt - 200) * 0.5, (heig - 100) * 0.5, 200, 100);
}

#pragma mark - show、present、dismiss
+ (instancetype)alertWindowWith:(NSDictionary *)params withFromVc:(UIViewController *_Nullable)fromVc {
    
    ZMAlertWindowController *updateVc = [[ZMAlertWindowController alloc] init];
    updateVc.fromController = fromVc;
    
    return updateVc;
}

// 显示弹框
- (void)presentFromView {
    
    if (alertWindow == nil) {
        alertWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        alertWindow.backgroundColor = [UIColor clearColor];
        alertWindow.windowLevel = UIWindowLevelAlert - 1;
        //        alertWindow.windowLevel = UIWindowLevelAlert;
    }
    
    alertWindow.rootViewController = self;
    
    self.alertView.transform = CGAffineTransformMakeScale(1.1, 1.1);
    self.maskView.alpha = 0.0;
    [UIView animateWithDuration:0.25 animations:^{
        self.alertView.transform = CGAffineTransformMakeScale(1.0, 1.0);
        self.maskView.alpha = 1.0;
    }];
    [alertWindow makeKeyAndVisible];
}

// dismiss掉弹框
- (void)dismissUpdateAlert {
    
    self.maskView.alpha = 0.0;
    [self.maskView removeFromSuperview];
    
    alertWindow.hidden = YES;
    self.fromController = nil;
    alertWindow = nil;
}


#pragma mark - getters
- (UIView *)maskView {
    if (_maskView == nil) {
        // 蒙版
        _maskView = [[UIView alloc] init];
        _maskView.backgroundColor = [UIColor colorWithRed:((float)((0x333333 & 0xFF0000) >> 16))/255.0 green:((float)((0x333333 & 0xFF00) >> 8))/255.0 blue:((float)(0x333333 & 0xFF))/255.0 alpha:0.4];
        _maskView.alpha = 0.0;
        _maskView.userInteractionEnabled = YES;
        [_maskView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissUpdateAlert)]];
    }
    return _maskView;
}

- (UIView *)alertView {
    if (_alertView == nil) {
        _alertView = [[UIView alloc] init];
        _alertView.backgroundColor = [UIColor yellowColor];
    }
    return _alertView;
}

- (void)dealloc {
//    NSLog(@"==========  销毁啦");
}

@end
