//
//  NSMutableArray+Safe.h
//  工具类的使用
//
//  Created by czm on 2019/11/7.
//  Copyright © 2019 czm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (Safe)

//添加
- (void)safeAddObject:(id)object;
- (void)safeAddObjectsFromArray:(NSArray *)array;
- (void)safeInsertObject:(id)object atIndex:(NSInteger)index;
//替换
- (void)safeReplaceObjectAtIndex:(NSInteger)index  withObject:(id)object;

//添加基本类型数组元素
- (void)safeAddObjectWithInteger:(NSInteger)number;
- (void)safeAddObjectWithDouble:(double)number;
- (void)safeAddObjectWithFloat:(float)number;
- (void)safeAddObjectWithLong:(long long)number;
- (void)safeAddObjectWithRang:(NSRange)rang;
- (void)safeAddObjectWithRect:(CGRect)rect;
- (void)safeAddObjectWithPoint:(CGPoint)point;
- (void)safeAddObjectWithSize:(CGSize)size;

//删除元素
- (void)safeRemoveObjectAtIndex:(NSInteger)index;

//遍历数组转化
- (void)mapUsingBlock:(id (^)(id object, NSInteger index))block;

//筛选数组找到符合条件的数据数组
- (void)filterUsingBlock:(BOOL (^) (id object))findBlock stopWhenFind:(BOOL)stopWhenFind;

//删除符合条件的元素
- (void)deleteUsingBlock:(BOOL (^)(id object))deleteBlock stopWhenDelete:(BOOL)stopWhenDelete;

//重组数组(打乱顺序)
- (void)shuffle;
//数组倒序
- (void)reverse;
//数组去重
- (void)unique;


@end

NS_ASSUME_NONNULL_END
