//
//  NSArray+Safe.h
//  工具类的使用
//
//  Created by czm on 2019/11/7.
//  Copyright © 2019 czm. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (Safe)

//数据为空判断
+ (BOOL)isEmptyWithArray:(NSArray *)array;

//取值
- (id)safeObjectAtIndex:(NSInteger)index;
//随机元素
- (id)randomObject;

//添加
- (NSMutableArray *)safeAddObject:(id)object;

//删除元素
- (NSMutableArray *)safeArrayRemoveObjectAtIndex:(NSInteger)index;

//遍历数组转化
- (NSArray *)mapArrayUsingBlock:(id (^)(id object, NSInteger index))block;

//筛选数组找到符合条件的数据数组
- (NSArray *)filterArrayUsingBlock:(BOOL (^) (id object))findBlock stopWhenFind:(BOOL)stopWhenFind;

//删除符合条件的元素
- (NSArray *)deleteArrayUsingBlock:(BOOL (^)(id object))deleteBlock stopWhenDelete:(BOOL)stopWhenDelete;

//重组数组(打乱顺序)
- (NSArray *)shuffledArray;
//数组倒序
- (NSArray *)reversedArray;
//数组去重
- (NSArray *)uniqueArray;

@end

NS_ASSUME_NONNULL_END
