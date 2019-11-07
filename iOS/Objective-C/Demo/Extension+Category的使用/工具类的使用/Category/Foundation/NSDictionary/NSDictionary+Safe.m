//
//  NSDictionary+Safe.m
//  工具类的使用
//
//  Created by czm on 2019/11/7.
//  Copyright © 2019 czm. All rights reserved.
//

#import "NSDictionary+Safe.h"
#import "NSMutableDictionary+Safe.h"

@implementation NSDictionary (Safe)

- (BOOL)hasKey:(id)key {
    return [self objectForKey:key] != nil;
}

//赋值
- (void)safeSetValue:(id)value forKey:(id)key {
    if (key && value) {
        [self setValue:value forKey:key];
    }
}


//取值
- (id)safeValueForKey:(id)key {
    if ([self hasKey:key]) {
        id value = [self valueForKey:key];
        if (![value isEqual:[NSNull null]]) {
            return value;
        }
    }
    return nil;
}


- (NSString*)stringForKey:(id)key {
    id value = [self objectForKey:key];
    if (value == nil || value == [NSNull null]) {
        return nil;
    }
    if ([[value description] isEqualToString:@"(null)"]) {
        return nil;
    }
    if ([value isKindOfClass:[NSString class]]) {
        return (NSString*)value;
    }
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value stringValue];
    }
    
    return nil;
}

- (NSNumber*)numberForKey:(id)key {
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSNumber class]]) {
        return (NSNumber*)value;
    }
    if ([value isKindOfClass:[NSString class]]) {
        NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
        return [f numberFromString:(NSString*)value];
    }
    return nil;
}


- (NSArray*)arrayForKey:(id)key {
    id value = [self objectForKey:key];
    if (value == nil || value == [NSNull null]) {
        return nil;
    }
    if ([value isKindOfClass:[NSArray class]]) {
        return value;
    }
    return nil;
}


- (NSDictionary*)dictionaryForKey:(id)key {
    id value = [self objectForKey:key];
    if (value == nil || value == [NSNull null]) {
        return nil;
    }
    if ([value isKindOfClass:[NSDictionary class]]) {
        return value;
    }
    return nil;
}

- (NSInteger)integerForKey:(id)key {
    id value = [self objectForKey:key];
    if (value == nil || value == [NSNull null]) {
        return 0;
    }
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
        return [value integerValue];
    }
    return 0;
}

- (BOOL)boolForKey:(id)key {
    id value = [self objectForKey:key];
    
    if (value == nil || value == [NSNull null]) {
        return NO;
    }
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value boolValue];
    }
    if ([value isKindOfClass:[NSString class]]) {
        return [value boolValue];
    }
    return NO;
}

- (double)doubleForKey:(id)key {
    id value = [self objectForKey:key];
    
    if (value == nil || value == [NSNull null]) {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value doubleValue];
    }
    return 0;
}

//合并
+ (NSMutableDictionary *)safeDictionaryByMerging:(NSDictionary *)dict1 with:(NSDictionary *)dict2 {
    NSMutableDictionary * result = [NSMutableDictionary dictionaryWithDictionary:dict1];
    [dict2 enumerateKeysAndObjectsUsingBlock: ^(id key, id obj, BOOL *stop) {
        if (![dict1 objectForKey:key]) {
            if ([obj isKindOfClass:[NSDictionary class]]) {
                NSDictionary * newVal = [[dict1 objectForKey: key] safeDictionaryByMergingWith: (NSDictionary *) obj];
                if (newVal && key) {
                    [result setObject: newVal forKey: key];
                }
                
            } else {
                if (obj && key) {
                    [result setObject: obj forKey: key];
                }
            }
        }
    }];
    return [result copy];
}

- (NSMutableDictionary *)safeDictionaryByMergingWith:(NSDictionary *)dict {
    return [[self class] safeDictionaryByMerging:self with: dict];
}


//转换为json字符串
- (NSString *)safeJSONString {
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    if (jsonData == nil) {
#ifdef DEBUG
        NSLog(@"fail to get JSON from dictionary: %@, error: %@", self, error);
#endif
        return nil;
    }
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}

//删除元素
- (NSDictionary *)safeDictionaryRemoveObjectForKey:(id)key {
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithDictionary:self];
    [dict safeRemoveObjectForKey:key];
    return [dict copy];
}

//遍历字典转化修改
- (NSDictionary *)mapDictionaryUsingBlock:(id (^)(id object, NSString *key))block {
    if (block) {
        __block NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            [dict setObject:block(obj, key) forKey:key];
        }];
        return [dict copy];
    }
    return self;
}

//筛选符合条件的键值对
- (NSDictionary *)filterDictionaryUsingBlock:(BOOL (^) (id object, NSString *key))findBlock stopWhenFind:(BOOL)stopWhenFind {
    if (findBlock) {
        __block NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        
        [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            if (findBlock (obj, key)) {
                [dict setObject:obj forKey:key];
                *stop = stopWhenFind;
            }
        }];
        return [dict copy];
    }
    
    return self;
}

//删除符合条件的元素
- (NSDictionary *)deleteDictionaryUsingBlock:(BOOL (^)(id object, NSString *key))deleteBlock stopWhenDelete:(BOOL)stopWhenDelete {
    
    if (deleteBlock) {
        __block NSMutableArray *keys = [NSMutableArray array];
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithDictionary:self];
        
        [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            if (deleteBlock(obj,key)) {
                [keys addObject:key];
                *stop = stopWhenDelete;
            }
        }];
        [dict removeObjectsForKeys:keys];
        return [dict copy];
    }
    
    return self;
}

@end
