//
//  NSDictionary+Safe.h
//  工具类的使用
//
//  Created by czm on 2019/11/7.
//  Copyright © 2019 czm. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (Safe)

//是否有key
- (BOOL)hasKey:(id)key;

//赋值
- (void)safeSetValue:(id)value forKey:(id)key;

//取值
- (id)safeValueForKey:(id)key;

- (NSString*)stringForKey:(id)key;
- (NSNumber*)numberForKey:(id)key;
- (NSArray*)arrayForKey:(id)key;
- (NSDictionary*)dictionaryForKey:(id)key;
- (NSInteger)integerForKey:(id)key;
- (BOOL)boolForKey:(id)key;
- (double)doubleForKey:(id)key;

//合并
+ (NSMutableDictionary *)safeDictionaryByMerging:(NSDictionary *)dict1 with:(NSDictionary *)dict2;
- (NSMutableDictionary *)safeDictionaryByMergingWith:(NSDictionary *)dict;


//转换为json字符串
- (NSString *)safeJSONString;

//删除元素
- (NSDictionary *)safeDictionaryRemoveObjectForKey:(id)key;

//遍历字典转化修改
- (NSDictionary *)mapDictionaryUsingBlock:(id (^)(id object, NSString *key))block;

//筛选符合条件的键值对
- (NSDictionary *)filterDictionaryUsingBlock:(BOOL (^) (id object, NSString *key))findBlock stopWhenFind:(BOOL)stopWhenFind;

//删除符合条件的元素
- (NSDictionary *)deleteDictionaryUsingBlock:(BOOL (^)(id object, NSString *key))deleteBlock stopWhenDelete:(BOOL)stopWhenDelete;

@end

NS_ASSUME_NONNULL_END
