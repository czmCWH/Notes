//
//  OneViewController.m
//  ViewController转场动画
//
//  Created by czm on 2019/11/13.
//  Copyright © 2019 czm. All rights reserved.
//

#import "OneViewController.h"
#import "HomeViewController.h"

@interface OneViewController ()

@end

@implementation OneViewController

- (instancetype)init {
    if (self = [super init]) {
        _transitionDelegate = [[ZMNavigationTransitionDelegate alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"One";
    
    self.view.backgroundColor = [UIColor colorWithHex:0xFFA3F0];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 200, 100, 50);
    [btn setTitle:@"点击一下" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor colorWithHex:0x9AFFF2];
    [btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    //添加pan手势
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc] init];
    [pan addTarget:self action:@selector(panGestureRecognizerAction:)];
    [self.view addGestureRecognizer:pan];
}

- (void)clickBtn {
    
}

// 添加手势控制动画进度
- (void)panGestureRecognizerAction:(UIPanGestureRecognizer *)pan{
    
    
    CGFloat translationX = [pan translationInView:self.view].x;
    
    //产生百分比
    CGFloat process = ABS(translationX) / self.view.width;
//    NSLog(@"====czm=== %f", process);
    
    ZMNavigationTransitionDelegate *navDelegate = self.transitionDelegate;
    
    if (pan.state == UIGestureRecognizerStateBegan) {
        CGFloat velocityX = [pan velocityInView:self.view].x;
        if (velocityX < 0) {
            navDelegate.interactive = YES;
            //触发pop转场动画
            [self.navigationController popViewControllerAnimated:YES];
        }
    
    } else if (pan.state == UIGestureRecognizerStateChanged) {
        
        [navDelegate.interactiveTransition updateInteractiveTransition:process];
        
    } else if (pan.state == UIGestureRecognizerStateEnded
              || pan.state == UIGestureRecognizerStateCancelled){
        if (process > 0.3) {
            [navDelegate.interactiveTransition finishInteractiveTransition];
        }else{
            [navDelegate.interactiveTransition cancelInteractiveTransition];
        }
        navDelegate.interactive = NO;
    }
}


@end
