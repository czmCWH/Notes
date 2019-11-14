//
//  TwoViewController.m
//  导航控制器(一)
//
//  Created by czm on 2019/11/11.
//  Copyright © 2019 czm. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Two";
    self.view.backgroundColor = [UIColor greenColor];
}



- (void)back{
 
    [self.navigationController popViewControllerAnimated:YES];
 
}
@end
