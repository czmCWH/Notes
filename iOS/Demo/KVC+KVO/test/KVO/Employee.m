//
//  Employee.m
//  test
//
//  Created by czm on 2020/10/14.
//  Copyright © 2020 czm. All rights reserved.
//

#import "Employee.h"

@implementation Employee

- (instancetype)initWithSalary:(NSNumber *)salary {
    if (self = [super init]) {
        self.salary = salary;
    }
    return self;
}

@end
