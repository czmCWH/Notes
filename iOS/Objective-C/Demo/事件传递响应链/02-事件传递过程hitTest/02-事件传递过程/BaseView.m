//
//  BaseView.m
//  02-事件传递过程
//
//  Created by czm on 2019/10/16.
//  Copyright © 2019 czm. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@ --- touchesBegan:", [self class]);
}



@end
