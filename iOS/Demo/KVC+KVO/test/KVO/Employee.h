//
//  Employee.h
//  test
//
//  Created by czm on 2020/10/14.
//  Copyright © 2020 czm. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Employee : NSObject

@property (nonatomic, strong)NSNumber *salary;

- (instancetype)initWithSalary:(NSNumber *)salary;

@end

NS_ASSUME_NONNULL_END
