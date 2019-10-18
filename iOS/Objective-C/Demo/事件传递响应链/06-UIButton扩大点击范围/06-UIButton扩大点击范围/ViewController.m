//
//  ViewController.m
//  06-UIButton扩大点击范围
//
//  Created by czm on 2019/10/18.
//  Copyright © 2019 czm. All rights reserved.
//

#import "ViewController.h"
#import "ZMHitButton.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet ZMHitButton *redBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.redBtn.stretchW = 40.0;
    self.redBtn.stretchH = 40.0;
}

- (IBAction)clickRedBtn:(ZMHitButton *)sender {
    NSLog(@"======== 点击了红色按钮");
}

@end
