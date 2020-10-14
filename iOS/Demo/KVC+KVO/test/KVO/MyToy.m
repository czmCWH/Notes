//
//  MyToy.m
//  test
//
//  Created by czm on 2020/10/13.
//  Copyright © 2020 czm. All rights reserved.
//

#import "MyToy.h"

@implementation MyToy

// 定义依赖键的方法
- (NSString *)info {
    return [NSString stringWithFormat:@"我的玩具车名为：%@，花了我%f元钱", self.car.name, self.car.price];
}

// 指定 info 依赖于 car.name 和 car.price
+ (NSSet<NSString *> *)keyPathsForValuesAffectingValueForKey:(NSString *)key {

    // 避免干扰父类中的方法
    NSSet *set = [super keyPathsForValuesAffectingValueForKey:key];

    if ([key isEqualToString:@"info"]) {
        NSArray *affectingKeys = @[@"car.name", @"car.price"];
        set = [set setByAddingObjectsFromArray:affectingKeys];
    }
    return set;
}

// keyPathsForValuesAffecting<Key>  与 keyPathsForValuesAffectingValueForKey: 作用一致，可以替代它
// 当你在 Category 中添加计算属性时，不能重写 keyPathsForValuesAffectingValueForKey:，而需要采用 keyPathsForValuesAffecting<Key>
//+ (NSSet<NSString *> *)keyPathsForValuesAffectingInfo {
//    return [NSSet setWithObjects:@"car.name", @"car.price", nil];
//}

@end
