//
//  NSMutableDictionary+Safe.h
//  工具类的使用
//
//  Created by czm on 2019/11/7.
//  Copyright © 2019 czm. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableDictionary (Safe)


//对象赋值
- (void)safeSetObject:(id)object forKey:(id)key;

//基本类型赋值
- (void)safeSetBoolObject:(BOOL)number forKey:(id)key;
- (void)safeSetIntObject:(int)number forKey:(id)key;
- (void)safeSetIntegerObject:(NSInteger)number forKey:(id)key;
- (void)safeSetUnsignedIntegerObject:(NSUInteger)number forKey:(id)key;

- (void)safeSetCharObject:(char)c forKey:(id)key;
- (void)safeSetDoubleObject:(double)number forKey:(id)key;
- (void)safeSetFloatObject:(float)number forKey:(id)key;
- (void)safeSetLongLongObject:(long long)number forKey:(id)key;

- (void)safeSetCGFloatObject:(CGFloat)f forKey:(id)key;
- (void)safeSetPointObject:(CGPoint)point forKey:(id)key;
- (void)safeSetSizeObject:(CGSize)size forKey:(id)key;
- (void)safeSetRectObject:(CGRect)rect forKey:(id)key;

//删除元素
- (void)safeRemoveObjectForKey:(id)key;

//遍历字典转化修改
- (void)mapUsingBlock:(id (^)(id object, NSString *key))block;

//筛选符合条件的键值对
- (void)filterUsingBlock:(BOOL (^) (id object, NSString *key))findBlock stopWhenFind:(BOOL)stopWhenFind;

//删除符合条件的元素
- (void)deleteUsingBlock:(BOOL (^)(id object, NSString *key))deleteBlock stopWhenDelete:(BOOL)stopWhenDelete;


@end

NS_ASSUME_NONNULL_END
