//
//  ViewController.m
//  05-子控件超出父控件bounds响应事件
//
//  Created by czm on 2019/10/16.
//  Copyright © 2019 czm. All rights reserved.
//

#import "ViewController.h"
#import "ChatBtn.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet ChatBtn *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)clickBtn:(ChatBtn *)sender {
    
    if (![[sender viewWithTag:111] isKindOfClass:[UIButton class]]) {
        UIButton *imgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        imgBtn.tag = 111;
        imgBtn.frame = CGRectMake(50, -100, 100, 100);
        [imgBtn setImage:[UIImage imageNamed:@"Dialog_img"] forState:UIControlStateNormal];
        [imgBtn setImage:[UIImage imageNamed:@"sun_1"] forState:UIControlStateHighlighted];
        [sender addSubview:imgBtn];
    }
}

@end
