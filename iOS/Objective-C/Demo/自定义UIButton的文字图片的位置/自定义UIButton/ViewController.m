//
//  ViewController.m
//  自定义UIButton
//
//  Created by czm on 2019/10/28.
//  Copyright © 2019 czm. All rights reserved.
//

#import "ViewController.h"
#import "ZMButton.h"

@interface ViewController ()

@property (nonatomic, strong)ZMButton *redBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    ZMButton *redBtn = [ZMButton buttonWithLayout:ZMButtonLayoutBottom frame:CGRectMake(100, 380, 50, 100) normalImg:[UIImage imageNamed:@"location"] highlightImg:nil title:@"武汉" marginHV:8];
    redBtn.backgroundColor = [UIColor redColor];
    [redBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:redBtn];
    self.redBtn = redBtn;
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 300, 100, 50);
    btn.backgroundColor = [UIColor purpleColor];
    [btn setTitle:@"上海" forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"location"] forState:UIControlStateNormal];
    
    
    
    
    // button 的各个尺寸
    CGFloat marginHV = 8.0;
    CGSize btnSize = btn.frame.size;
    CGSize titleSize = btn.titleLabel.intrinsicContentSize;
    CGSize imgSize = btn.imageView.frame.size;
    
    
//    btn.frame = CGRectMake(100, 300, 100, titleSize.height + imgSize.height + 18);
    
    // 1、图片在上、文字在下
//    CGFloat topBottomH = (btnSize.height - titleSize.height - imgSize.height - marginHV) * 0.5;
//
//    btn.titleEdgeInsets = UIEdgeInsetsMake(topBottomH + titleSize.height + marginHV,
//                                           (btnSize.width - titleSize.width)/2.0 - imgSize.width,
//                                           topBottomH,
//                                           (btnSize.width - titleSize.width)/2.0);
//
//    btn.imageEdgeInsets = UIEdgeInsetsMake(topBottomH,
//                                           (btnSize.width - imgSize.width)/2.0,
//                                           marginHV + topBottomH + titleSize.height,
//                                           (btnSize.width - imgSize.width)/2.0 - titleSize.width);
    [self.view addSubview:btn];
    
    
    
    // 2、文字在上，图片在下
//    btn.titleEdgeInsets = UIEdgeInsetsMake(topBottomH,
//                                           (btnSize.width - titleSize.width)/2.0 - imgSize.width,
//                                           topBottomH + marginHV + imgSize.height,
//                                           (btnSize.width - titleSize.width)/2.0);
//
//    btn.imageEdgeInsets = UIEdgeInsetsMake(topBottomH + marginHV + titleSize.height,
//                                           (btnSize.width - imgSize.width)/2.0,
//                                           topBottomH,
//                                           (btnSize.width - imgSize.width)/2.0 - titleSize.width);
    
    
    btn.frame = CGRectMake(100, 300, titleSize.width + imgSize.width + 58, 50);
    
    // 3、文字在左，图片在右
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, -(titleSize.width + imgSize.width), 0, 0);
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -(titleSize.width + imgSize.width + marginHV));
    
    
    // 4、默认：图片在右，文字在左边
//    btn.titleEdgeInsets = UIEdgeInsetsZero;
//    btn.imageEdgeInsets = UIEdgeInsetsZero;
    
    
//    // UIControl 的内容水平垂直方向对齐方式
//    btn.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
//    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
//
//    // UIButton 的文字和图片的边界约束
//    btn.titleEdgeInsets = UIEdgeInsetsZero;
//    btn.imageEdgeInsets = UIEdgeInsetsZero;
    
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.redBtn.frame = CGRectMake(100, 380, 50, 80);
}


@end
