//
//  NSData+Handle.m
//  工具类的使用
//
//  Created by czm on 2019/11/7.
//  Copyright © 2019 czm. All rights reserved.
//

#import "NSData+Handle.h"

@implementation NSData (Handle)

- (NSString *)getString{
    return [[NSString alloc] initWithData:self encoding:NSUTF8StringEncoding];
}

- (NSString *)getAPNSToken{
    return [[[[self description]
              stringByReplacingOccurrencesOfString: @"<" withString: @""]
             stringByReplacingOccurrencesOfString: @">" withString: @""]
            stringByReplacingOccurrencesOfString: @" " withString: @""];
}

@end
