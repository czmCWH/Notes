//
//  HomeViewController.m
//  ViewController转场动画
//
//  Created by czm on 2019/11/13.
//  Copyright © 2019 czm. All rights reserved.
//

#import "HomeViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"

#import "ZMModalTransitionDelegate.h"


@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)ZMModalTransitionDelegate *modalDelagte;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"首页";
    NSLog(@"push");
    [self.view addSubview:self.tableView];
    
    
    
    
    // UIViewControllerTransitioningDelegate
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.tableView.frame = self.view.bounds;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * const cellId = @"cellid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第 %ld 行", (long)indexPath.row];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        
        OneViewController *one = [[OneViewController alloc] init];
        // 可以通过该代理，对UINavigationController管理的对象进行push 或 pop 时，修改他们的行为
        self.navigationController.delegate = self;
        [self.navigationController pushViewController:one animated:YES];
        
    } else if (indexPath.row == 1) {
        
        
        
        TwoViewController *two = [[TwoViewController alloc] init];
        
        // 模态呈现VC在屏幕上显示的样式
//        two.modalPresentationStyle = UIModalPresentationCustom;
        // 模态呈现VC时使用的转场动画样式
//        two.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        
        two.modalPresentationStyle = UIModalPresentationCustom;
        two.transitioningDelegate = self.modalDelagte;
        
        [self presentViewController:two animated:YES completion:nil];
        
        
        
        
    } else if (indexPath.row == 2) {
      
        
        
    } else {
        
        TwoViewController *two = [[TwoViewController alloc] init];
        // 可以通过该代理，对UINavigationController管理的对象进行push 或 pop 时，修改他们的行为
        self.navigationController.delegate = nil;
        [self.navigationController pushViewController:two animated:YES];
    }
    
    
}

#pragma mark - getters
- (ZMModalTransitionDelegate *)modalDelagte {
    if (_modalDelagte == nil) {
        _modalDelagte = [[ZMModalTransitionDelegate alloc] init];
    }
    return _modalDelagte;
}


- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        _tableView.rowHeight = 50;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.separatorColor = [UIColor colorWithHex:0xf2f2f2];
        _tableView.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15);
        
        // 如果设置rowHeight 为 UITableViewAutomaticDimension，则需要提供预估高度，提高表格加载性能
//        _tableView.estimatedRowHeight = 0;
//        _tableView.estimatedSectionFooterHeight = 0;
//        _tableView.estimatedSectionHeaderHeight = 0;
            
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.tableHeaderView = [[UIView alloc] init];
        _tableView.tableFooterView = [[UIView alloc] init];
    }
    return _tableView;
}


@end
