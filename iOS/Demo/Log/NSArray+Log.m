//
//  NSArray+Log.m
//  test
//
//  Created by czm on 2020/10/9.
//  Copyright © 2020 czm. All rights reserved.
//

#import "NSArray+Log.h"

@implementation NSArray (Log)

- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *strM = [NSMutableString stringWithString:@"(\n"];

    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [strM appendFormat:@"\t%@,\n", obj];
    }];

    [strM appendString:@")"];

    return strM;
}

#ifdef DEBUG
// NSLog数组对象时会调用此方法，将里面的中文在控制台打印出来
- (NSString *)descriptionWithLocale:(nullable id)locale indent:(NSUInteger)level {
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSString *logString;
        @try {
            logString = [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil] encoding:NSUTF8StringEncoding];
        } @catch (NSException *exception) {
            logString = [NSString stringWithFormat:@"打印数组时转换失败：%@",exception.reason];
        } @finally {
            return logString;
        }
    }
    NSMutableString *string = [NSMutableString stringWithString:@"{\n"];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [string appendFormat:@"\t%@,\n", obj];
    }];
    [string appendString:@"}\n"];
    return string;
}
#endif

@end

@implementation NSDictionary (Log)


- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *strM = [NSMutableString stringWithString:@"{\n"];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [strM appendFormat:@"\t%@ = %@;\n", key, obj];
    }];
    
    [strM appendString:@"}\n"];
    
    return strM;
}

#ifdef DEBUG
- (NSString *)descriptionWithLocale:(nullable id)locale indent:(NSUInteger)level {
    // 此注释掉的版本有缺陷，当self里面包含json转换不支持的类型时会报错：Invalid type in JSON write
    /*
    NSString *logString;
    @try {
        logString = [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil] encoding:NSUTF8StringEncoding];
    } @catch (NSException *exception) {
        logString = [NSString stringWithFormat:@"打印字典时转换失败：%@",exception.reason];
    } @finally {
        return logString;
    }
     */
    
    // 以下为两种方式结合处理
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSString *logString;
        @try {
            logString = [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil] encoding:NSUTF8StringEncoding];
        } @catch (NSException *exception) {
            logString = [NSString stringWithFormat:@"打印字典时转换失败：%@",exception.reason];
        } @finally {
            return logString;
        }
    }
    
    NSMutableString *string = [NSMutableString stringWithString:@"{\n"];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [string appendFormat:@"\t%@ = %@;\n", key, obj];
    }];
    [string appendString:@"}\n"];
    return string;
}
#endif

@end
