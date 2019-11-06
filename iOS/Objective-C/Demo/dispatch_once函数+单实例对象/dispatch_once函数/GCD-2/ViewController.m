//
//  ViewController.m
//  GCD-2
//
//  Created by 陈正茂 on 16/3/18.
//  Copyright © 2016年 陈正茂. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
//触摸屏幕时调用此方法
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //定义一个dispatch_once的结果参数
    static dispatch_once_t onceToken;
    //打印结果参数
    NSLog(@"onceToken: %ld", onceToken);
    //dispatch_once函数只会执行它内部的代码块一次
    dispatch_once(&onceToken, ^{
        NSLog(@"hello");
    });
    
    /*  触摸屏幕3次,打印的结果**/
    //即:可以看出dispatch_once函数执行一次后,会把它的结果参数至为-1,使它的内部代码不会被第二次执行.
    /*结果:
        onceToken: 0
        hello
        onceToken: -1
        onceToken: -1
        onceToken: -1
     */
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
