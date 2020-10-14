//
//  Person.m
//  test
//
//  Created by czm on 2020/10/10.
//  Copyright © 2020 czm. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)personWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@"😭😭😭😭未找到key: %@", key);
}

@end
