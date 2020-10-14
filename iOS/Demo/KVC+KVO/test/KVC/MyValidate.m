//
//  MyValidate.m
//  test
//
//  Created by czm on 2020/10/10.
//  Copyright © 2020 czm. All rights reserved.
//

#import "MyValidate.h"

@implementation MyValidate


- (instancetype)init {
    if (self = [super init]) {
        _funName = @"ABC";
    }
    return self;
}

// 验证属性 name  的值是否为 `admin`
- (BOOL)validateName:(inout id *)value error:(out NSError *__autoreleasing  _Nullable *)outError {
    
    NSString *name = *value;
    BOOL res = NO;
    
    if ([name isEqualToString:@"admin"]) {
        res = YES;
    } else {
        
//        NSError *err = [[NSError alloc] initWithDomain:NSCocoaErrorDomain code:100 userInfo:@{NSLocalizedDescriptionKey:@"描述：设置name值不符合要求",
//                       NSLocalizedFailureReasonErrorKey:@"原因：name的值必须为admin",
//                       NSLocalizedRecoverySuggestionErrorKey:@"建议：修改name的值"}];
//        res = NO;
//        *outError = err;

        *value = @"admin";
        res = YES;
    }
    return res;
}


// 步骤1
- (NSNumber *)getNum {
    return @123;
}

- (void)setNum:(NSNumber *)num {
    
}

// 步骤2
// 决定代理数组元素的个数
- (NSUInteger)countOfArr {
    return 3;
}

// 该方法返回值依次作为代理数组的元素
// [ [123,], [456,], [???,] ]
//- (NSArray *)objectInArrAtIndex:(NSUInteger)index {
//    switch (index) {
//        case 0: return @[@"123"];
//        case 1: return @[@"456"];
//        default:  return @[@"???"];
//    }
//}


// 如果未实现 objectIn<Key>AtIndex: 则此方法会被调用，返回值为数组类型，依次取该数组的第一个元素作为代理数组的元素
// [123, 456, ???]
- (NSArray *)arrAtIndexes:(NSIndexSet *)indexes {
    switch (indexes.firstIndex) {
        case 0: return @[@"123", @"a"];
        case 1: return @[@"456", @"b"];
        default:  return @[@"???", @"c"];
    }
}


// 步骤3
- (NSUInteger)countOfAnimal {
    return 2;
}

// 返回值必须为 NSEnumerator 类型的枚举器，元素个数与 countOfAnimal 必须对应
- (NSEnumerator *)enumeratorOfAnimal {
    NSSet *set = [[NSSet alloc] initWithObjects:@"abc",@"123", nil];
    NSEnumerator *enumerator = [set objectEnumerator];
    return enumerator;
}

- (NSString *)memberOfAnimal:(id)index {
    return @"xxx";
}


// 步骤4
+ (BOOL)accessInstanceVariablesDirectly {
    return YES;
}

@end
