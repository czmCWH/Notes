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
#import "ThreeViewController.h"

@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSArray <NSString *>*titleArr;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"首页";
    [self.view addSubview:self.tableView];
    
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.tableView.frame = self.view.bounds;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * const cellId = @"cellid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.text = self.titleArr[indexPath.row];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        
        // 参考于：https://github.com/sundayios/WSLTransferAnimation-master
        
        OneViewController *one = [[OneViewController alloc] init];
        // 可以通过该代理，对UINavigationController管理的对象进行push 或 pop 时，修改他们的行为
        self.navigationController.delegate = one.transitionDelegate;
        [self.navigationController pushViewController:one animated:YES];
        
    } else if (indexPath.row == 1) {
        
        // 参考于：https://github.com/cnthinkcode/HSPresentTransitionDemo
        
        TwoViewController *two = [[TwoViewController alloc] init];
        [self presentViewController:two animated:YES completion:nil];

    } else if (indexPath.row == 2) {
      
        ThreeViewController *three = [[ThreeViewController alloc] init];
        [self presentViewController:three animated:YES completion:nil];
        
    } else {
        
        TwoViewController *two = [[TwoViewController alloc] init];
        // 可以通过该代理，对UINavigationController管理的对象进行push 或 pop 时，修改他们的行为
        self.navigationController.delegate = nil;
        [self.navigationController pushViewController:two animated:YES];
    }
}

#pragma mark - getters
- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.separatorColor = [UIColor colorWithHex:0xf2f2f2];
        _tableView.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15);
        
        // 如果设置rowHeight 为 UITableViewAutomaticDimension，则需要提供预估高度，提高表格加载性能
        _tableView.estimatedRowHeight = 50;
//        _tableView.estimatedSectionFooterHeight = 0;
//        _tableView.estimatedSectionHeaderHeight = 0;
            
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.tableHeaderView = [[UIView alloc] init];
        _tableView.tableFooterView = [[UIView alloc] init];
    }
    return _tableView;
}


- (NSArray *)titleArr {
    if (_titleArr == nil) {
        _titleArr = @[@"导航栏 push pop Transitioning", @"modal跳转 Transitioning", @"modal跳转改变VC的frame, 自定义UIAlertController", @"其它"];
    }
    return _titleArr;
}

@end
