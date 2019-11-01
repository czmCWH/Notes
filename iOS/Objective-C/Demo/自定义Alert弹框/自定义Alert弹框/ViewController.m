//
//  ViewController.m
//  自定义Alert弹框
//
//  Created by czm on 2019/11/1.
//  Copyright © 2019 czm. All rights reserved.
//

#import "ViewController.h"
#import "ZMAlertViewController.h"
#import "ZMAlertWindowController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self alertVC];
//    [self alertWindow];
}

- (void)alertVC {
    ZMAlertViewController *vc = [[ZMAlertViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)alertWindow {
    ZMAlertWindowController *vc = [ZMAlertWindowController alertWindowWith:nil withFromVc:self];
    [vc presentFromView];
}

@end
