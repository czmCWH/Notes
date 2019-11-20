//
//  ThreeViewController.m
//  ViewController转场动画
//
//  Created by czm on 2019/11/19.
//  Copyright © 2019 czm. All rights reserved.
//

#import "ThreeViewController.h"
#import "ThreeAnimator.h"

@interface ThreeViewController ()

@property (nonatomic, strong)ThreeAnimator *threeAnimator;

@property (nonatomic, strong)UILabel *lab;

@end

@implementation ThreeViewController

- (instancetype)init {
    if (self = [super init]) {
        // 转场样式
        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        // 模态呈现VC的样式
        self.modalPresentationStyle = UIModalPresentationCustom;
        self.transitioningDelegate = self.threeAnimator;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    self.lab = [[UILabel alloc] init];
    self.lab.textColor = [UIColor blackColor];
    self.lab.font = [UIFont systemFontOfSize:14];
    self.lab.numberOfLines = 0;
    self.lab.text = @"模态形式弹框，可以自定义ViewController的size，转场样式采用系统自带的，再也不怕UI设计弹框而导致不好管理了";
    self.lab.center = self.view.center;
    [self.view addSubview:self.lab];
    
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.lab.frame = CGRectMake(5, (self.view.height - 100)*0.5, self.view.width - 10, 100);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (ThreeAnimator *)threeAnimator {
    if (_threeAnimator == nil) {
        _threeAnimator = [[ThreeAnimator alloc] init];
    }
    return _threeAnimator;
}

@end
