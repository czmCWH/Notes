//
//  NSData+Handle.h
//  工具类的使用
//
//  Created by czm on 2019/11/7.
//  Copyright © 2019 czm. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (Handle)

//NSData-->String
- (NSString *)getString;

//将APNS NSData类型token 格式化成字符串
- (NSString *)getAPNSToken;


@end

NS_ASSUME_NONNULL_END
