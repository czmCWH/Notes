//
//  Department.h
//  test
//
//  Created by czm on 2020/10/14.
//  Copyright © 2020 czm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Employee.h"

NS_ASSUME_NONNULL_BEGIN

@interface Department : NSObject

@property (nonatomic, strong)NSArray <Employee *>*employees;
@property (nonatomic, strong)NSNumber *totalSalarys;

@end

NS_ASSUME_NONNULL_END
