//
//  MyBus.m
//  test
//
//  Created by czm on 2020/10/13.
//  Copyright © 2020 czm. All rights reserved.
//

#import "MyBus.h"

@implementation MyBus

// 根据 key 让特定的属性采用手动通知
+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key {
    BOOL automatic = NO;
    if ([key isEqualToString:@"arr"]) {
        automatic = NO;
    } else if ([key isEqualToString:@"numberID"]) {
        automatic = NO;
    } else {
        // 为任何未识别的键调用super
        automatic = [super automaticallyNotifiesObserversForKey:key];
    }
    return automatic;
}

// 在值发生更改时实现手动观察器通知
- (void)setArr:(NSMutableArray *)arr {
    if (![arr isEqual:@[]]) {
        [self willChangeValueForKey:@"arr"];
        _arr = arr;
        [self didChangeValueForKey:@"arr"];
    }
}

// 如果一个操作导致多个键发生更改，则必须嵌套更改通知
- (void)setNumberID:(NSInteger)numberID {
    [self willChangeValueForKey:@"numberID"];
    [self willChangeValueForKey:@"name"];
    _numberID = numberID;
    _name = [NSString stringWithFormat:@"%@_%ld", _name, numberID];
    [self didChangeValueForKey:@"name"];
    [self didChangeValueForKey:@"numberID"];
}

@end
