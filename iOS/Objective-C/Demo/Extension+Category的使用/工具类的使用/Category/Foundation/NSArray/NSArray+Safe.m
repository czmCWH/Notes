//
//  NSArray+Safe.m
//  工具类的使用
//
//  Created by czm on 2019/11/7.
//  Copyright © 2019 czm. All rights reserved.
//

#import "NSArray+Safe.h"
#import "NSMutableArray+Safe.h"

@implementation NSArray (Safe)

+ (BOOL)isEmptyWithArray:(NSArray *)array {
    if (array && (array.count > 0)) {
        return NO;
    }
    return YES;
}

- (id)safeObjectAtIndex:(NSInteger)index {
    if ((self.count > index) && (index >= 0)) {
        id obj = [self objectAtIndex:index];
        if (![obj isKindOfClass:[NSNull class]]) {
            return obj;
        }
    }
    NSLog(@"注意-------------->数组越界");
    return nil;
}

//取随机元素
- (id)randomObject {
    if (self && self.count > 0) {
        NSInteger index = arc4random() % self.count;
        return [self safeObjectAtIndex:index];
    }
    return nil;
}

//添加
- (NSMutableArray *)safeAddObject:(id)object {
    NSMutableArray *mutArray = [NSMutableArray array];
    
    if (self) {
        [mutArray safeAddObjectsFromArray:self];
    }
    [mutArray safeAddObject:object];
    return mutArray;

}
//删除元素
- (NSMutableArray *)safeArrayRemoveObjectAtIndex:(NSInteger)index {
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:self];
    [array safeRemoveObjectAtIndex:index];
    return array;
}

//转换
- (NSArray *)mapArrayUsingBlock:(id (^)(id, NSInteger))block {
    
    if (block) {
        __block NSMutableArray *array = [NSMutableArray array];
        
        [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [array safeAddObject:block(obj, idx)];
        }];
        return [array copy];
    }
    return self;
}

//筛选
- (NSArray *)filterArrayUsingBlock:(BOOL (^) (id object))findBlock stopWhenFind:(BOOL)stopWhenFind {
    
    if (findBlock) {
        __block NSMutableArray *array = [NSMutableArray array];
        [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (findBlock(obj)) {
                [array safeAddObject:obj];
                *stop = stopWhenFind;
            }
        }];
        
        return [array copy];
    }
    return self;
}

//删除符合条件的元素
- (NSArray *)deleteArrayUsingBlock:(BOOL (^)(id object))deleteBlock stopWhenDelete:(BOOL)stopWhenDelete {
    
    if (deleteBlock) {
        __block NSMutableArray *array = [NSMutableArray array];
        NSMutableArray *mutArray = [NSMutableArray array];
        [mutArray safeAddObjectsFromArray:self];
        
        [mutArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (deleteBlock(obj)) {
                [array safeAddObject:obj];
                *stop = stopWhenDelete;
            }
        }];
        [mutArray removeObjectsInArray:[array copy]];
        return [mutArray copy];
    }
    
    return self;
}

//数组乱序
- (NSArray *)shuffledArray {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.count];
    NSMutableArray *copy = [self mutableCopy];
    while (copy.count > 0)
    {
        NSInteger index = arc4random() % copy.count;
        id objectToMove = [copy objectAtIndex:index];
        [array addObject:objectToMove];
        [copy removeObjectAtIndex:index];
    }
    return [array copy];
}

//数组倒序
- (NSArray *)reversedArray {
    NSArray *reversedArray = [[self reverseObjectEnumerator] allObjects];
    return reversedArray;
}

//数组去重
- (NSArray *)uniqueArray {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([array containsObject:obj] == NO){
            [array addObject:obj];
        }
    }];
    return [array copy];
}

@end
