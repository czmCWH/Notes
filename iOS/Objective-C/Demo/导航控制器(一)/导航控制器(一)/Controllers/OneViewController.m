//
//  OneViewController.m
//  导航控制器(一)
//
//  Created by czm on 2019/11/11.
//  Copyright © 2019 czm. All rights reserved.
//

#import "OneViewController.h"

#import "TwoViewController.h"

@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"One";
    self.view.backgroundColor = [UIColor orangeColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"跳转" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.frame = CGRectMake(100, 300, 80, 50);
    btn.backgroundColor = [UIColor yellowColor];
    [btn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)clickAction:(UIButton *)btn {
    TwoViewController *two = [[TwoViewController alloc] init];
    [self.navigationController pushViewController:two animated:YES];
}

@end
