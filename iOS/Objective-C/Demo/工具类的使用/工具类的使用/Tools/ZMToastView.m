//
//  ZMToastView.m
//  工具类的使用
//
//  Created by czm on 2019/10/15.
//  Copyright © 2019 czm. All rights reserved.
//

#import "ZMToastView.h"

@implementation ZMToastView


+ (void)showWithTitle:(NSString *)title {
    
    CGFloat widt = [UIScreen mainScreen].bounds.size.width;
    
    //设置文本的最大显示范围
    CGSize maxSize = CGSizeMake(widt - 60, MAXFLOAT);
    CGSize realSize = [title boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size;
    
    ZMToastView *view = [[ZMToastView alloc]initWithFrame:CGRectMake(0, 0, realSize.width + 20, realSize.height + 10)];
    
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    
    [self dismiss];
    
    [window addSubview:view];
    
    view.center = CGPointMake(widt/2, [UIScreen mainScreen].bounds.size.height * 0.8);
    
    //    view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    view.backgroundColor = [UIColor blackColor];
    
    view.layer.cornerRadius = 3;
    
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, realSize.width, view.frame.size.height)];
    
    lable.text = title;
    
    lable.numberOfLines = 0;
    
    lable.textColor = [UIColor whiteColor];
    
    lable.font = [UIFont systemFontOfSize:14];
    
    lable.textAlignment = NSTextAlignmentCenter;
    
    [view addSubview:lable];
    
    [view performSelector:@selector(remove) withObject:nil afterDelay:3.0];
}



- (void)remove {
    [UIView animateWithDuration:0.5 animations:^{
        
        self.alpha = 0;
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
    }];
}

+ (void)dismiss {
    
    UIWindow *window=[[UIApplication sharedApplication].delegate window];
    
    [window.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        
        if ([obj isKindOfClass:[ZMToastView class]])
        {
            [obj removeFromSuperview];
            
            *stop=YES;
        }
    }];
}


@end
