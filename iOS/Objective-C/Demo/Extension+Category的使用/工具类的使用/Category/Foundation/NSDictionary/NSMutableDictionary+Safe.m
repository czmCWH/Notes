//
//  NSMutableDictionary+Safe.m
//  工具类的使用
//
//  Created by czm on 2019/11/7.
//  Copyright © 2019 czm. All rights reserved.
//

#import "NSMutableDictionary+Safe.h"
#import "NSDictionary+Safe.h"

@implementation NSMutableDictionary (Safe)

//对象赋值
- (void)safeSetObject:(id)object forKey:(id)key {
    if (key && object) {
        [self setObject:object forKey:key];
    }
}

//基本类型赋值
- (void)safeSetBoolObject:(BOOL)number forKey:(id)key {
    if (key) {
        [self setObject:@(number) forKey:key];
    }
}
- (void)safeSetIntObject:(int)number forKey:(id)key {
    if (key) {
        [self setObject:@(number) forKey:key];
    }
}
- (void)safeSetIntegerObject:(NSInteger)number forKey:(id)key {
    if (key) {
        [self setObject:@(number) forKey:key];
    }
}
- (void)safeSetUnsignedIntegerObject:(NSUInteger)number forKey:(id)key {
    if (key) {
        [self setObject:@(number) forKey:key];
    }
}

- (void)safeSetCharObject:(char)c forKey:(id)key {
    if (key) {
        [self setObject:@(c) forKey:key];
    }
}
- (void)safeSetDoubleObject:(double)number forKey:(id)key {
    if (key) {
        [self setObject:@(number) forKey:key];
    }
}
- (void)safeSetFloatObject:(float)number forKey:(id)key {
    if (key) {
        [self setObject:@(number) forKey:key];
    }
}
- (void)safeSetLongLongObject:(long long)number forKey:(id)key {
    if (key) {
        [self setObject:@(number) forKey:key];
    }
}

- (void)safeSetCGFloatObject:(CGFloat)f forKey:(id)key {
    if (key) {
        [self setObject:@(f) forKey:key];
    }
}
- (void)safeSetPointObject:(CGPoint)point forKey:(id)key {
    if (key) {
        [self setObject:NSStringFromCGPoint(point) forKey:key];
    }
}
- (void)safeSetSizeObject:(CGSize)size forKey:(id)key {
    if (key) {
        [self setObject:NSStringFromCGSize(size) forKey:key];
    }
}
- (void)safeSetRectObject:(CGRect)rect forKey:(id)key {
    if (key) {
        [self setObject:NSStringFromCGRect(rect) forKey:key];
    }
}

//删除元素
- (void)safeRemoveObjectForKey:(id)key {
    if (key) {
        [self removeObjectForKey:key];
    }
}

//遍历字典转化修改
- (void)mapUsingBlock:(id (^)(id object, NSString *key))block{
    
    if (block) {
        [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            [self safeSetObject:block(obj, key) forKey:key];
        }];
    }
    
}

//筛选符合条件的键值对
- (void)filterUsingBlock:(BOOL (^) (id object, NSString *key))findBlock stopWhenFind:(BOOL)stopWhenFind {
    
    if (findBlock) {
        __block NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        
        [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            if (findBlock (obj, key)) {
                [dict safeSetObject:obj forKey:key];
                *stop = stopWhenFind;
            }
        }];
        [self removeAllObjects];
        [self setDictionary:dict];
    }
}

//删除符合条件的元素
- (void)deleteUsingBlock:(BOOL (^)(id object, NSString *key))deleteBlock stopWhenDelete:(BOOL)stopWhenDelete {
    
    if (deleteBlock) {
        __block NSMutableArray *keys = [NSMutableArray array];
        [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            if (deleteBlock(obj,key)) {
                [keys addObject:key];
                *stop = stopWhenDelete;
            }
        }];
        [self removeObjectsForKeys:keys];
    }
}

@end
