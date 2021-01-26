//
//  TwoViewController.m
//  ViewController转场动画
//
//  Created by czm on 2019/11/13.
//  Copyright © 2019 czm. All rights reserved.
//

#import "TwoViewController.h"
#import "UIColor+Extension.h"
#import <Masonry/Masonry.h>

#import "ZMModalTransitionDelegate.h"

@interface TwoViewController ()

@property (nonatomic, strong)ZMModalTransitionDelegate *modalDelagte;

@property (nonatomic, strong)UIButton *btn;

@end

@implementation TwoViewController
- (instancetype)init {
    if (self = [super init]) {
        self.modalPresentationStyle = UIModalPresentationCustom;
        self.transitioningDelegate = self.modalDelagte;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithHex:0xFFA3F0];
    
    _btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_btn setTitle:@"点击一下" forState:UIControlStateNormal];
    [_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _btn.backgroundColor = [UIColor colorWithHex:0x9AFFF2];
    [_btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn];
    [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(50);
        make.center.equalTo(self.view);
    }];
        
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    v.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:v];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
//    self.btn.frame = CGRectMake((self.view.width - 100)*0.5, (self.view.height - 50)*0.5, 100, 50);
}

- (void)clickBtn {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (ZMModalTransitionDelegate *)modalDelagte {
    if (_modalDelagte == nil) {
        _modalDelagte = [[ZMModalTransitionDelegate alloc] init];
    }
    return _modalDelagte;
}



@end
