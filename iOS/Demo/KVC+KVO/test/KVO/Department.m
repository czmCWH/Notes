//
//  Department.m
//  test
//
//  Created by czm on 2020/10/14.
//  Copyright © 2020 czm. All rights reserved.
//

#import "Department.h"

static void *totalSalaryContext = &totalSalaryContext;

@implementation Department

- (instancetype)init {
    if (self = [super init]) {
        
        // 将 父级(Department) 注册为 子级(employees) 的观察者
        [self addObserver:self forKeyPath:@"employees" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:totalSalaryContext];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if (context == totalSalaryContext) {
        // 当 子级(employees) 值发生改变时，更新父级中依赖的属性，并手动发送通知
        [self updateTotalSalary];
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)updateTotalSalary {
    NSNumber *num = [self valueForKeyPath:@"employees.@sum.salary"];
    [self setTotalSalary:num];
}
 
- (void)setTotalSalary:(NSNumber *)newTotalSalary {

    if (_totalSalarys != newTotalSalary) {
        [self willChangeValueForKey:@"totalSalarys"];
        _totalSalarys = newTotalSalary;
        [self didChangeValueForKey:@"totalSalarys"];
    }
}

- (NSNumber *)totalSalary {
    return _totalSalarys;
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"totalSalary" context:totalSalaryContext];
}

@end
