//
//  ViewController.m
//  transform形变
//
//  Created by czm on 2019/10/17.
//  Copyright © 2019 czm. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
        
}

- (IBAction)clickTranslate:(id)sender {
    /* 在原来的基础上移动（只移动一次） */
//    self.imgView.transform = CGAffineTransformMakeTranslation(10, 10);
      
    /* 在移动后的基础上移动（可以一直移动） */
    self.imgView.transform = CGAffineTransformTranslate(self.imgView.transform, 20, 0);
}

- (IBAction)clickScale:(id)sender {
    /* 在原来的基础上缩放（只缩放一次） */
//    self.imgView.transform = CGAffineTransformMakeScale(2, 2);
      
    /* 在缩放后的基础上缩放（可以一直缩放） */
    self.imgView.transform = CGAffineTransformScale(self.imgView.transform, 2, 2);
}

- (IBAction)clickRotation:(id)sender {
    
    /* 在原来的基础上旋转（只旋转一次） */
//    self.imgView.transform = CGAffineTransformMakeRotation(M_PI_4);
      
    /* 在旋转后的基础上旋转（可以一直旋转） */
    self.imgView.transform = CGAffineTransformRotate(self.imgView.transform, M_PI_4);
}


- (IBAction)clickComplex:(id)sender {
    // 把 t1、t2 的形变，结合起来变换
//    CGAffineTransform t1 = CGAffineTransformScale(self.imgView.transform, 1.2, 1.2);
//    CGAffineTransform t2 = CGAffineTransformTranslate(self.imgView.transform, 5, 0);
//    self.imgView.transform = CGAffineTransformConcat(t1, t2);
    
    // 斜切
//    self.imgView.transform =  CGAffineTransformMake(1,0.5,0.5,1,0,0);
    
    
    self.imgView.transform = CGAffineTransformIdentity;
}

@end
