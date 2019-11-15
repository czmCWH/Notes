//
//  ZMBasicViewController.m
//  UITabBarController的使用
//
//  Created by czm on 2019/11/15.
//  Copyright © 2019 czm. All rights reserved.
//

#import "ZMBasicViewController.h"

@interface ZMBasicViewController ()

@end

@implementation ZMBasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 2、设置默认返回title
    // 系统会忽略 backBarButtonItem 绑定的事件，UINavigatonController自动为其绑定事件，只做POP动作。
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:nil];
    
    self.view.backgroundColor = [UIColor whiteColor];
}



@end
