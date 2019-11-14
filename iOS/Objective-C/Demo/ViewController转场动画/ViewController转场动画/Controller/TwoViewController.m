//
//  TwoViewController.m
//  ViewController转场动画
//
//  Created by czm on 2019/11/13.
//  Copyright © 2019 czm. All rights reserved.
//

#import "TwoViewController.h"
#import "UIColor+Extension.h"
#import <Masonry.h>

@interface TwoViewController ()

@property (nonatomic, strong)UIButton *btn;

@end

@implementation TwoViewController

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
}


- (void)clickBtn {
    [self dismissViewControllerAnimated:YES completion:nil];
}




@end
