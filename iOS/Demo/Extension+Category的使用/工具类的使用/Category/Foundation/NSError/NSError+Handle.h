//
//  NSError+Handle.h
//  工具类的使用
//
//  Created by czm on 2019/11/7.
//  Copyright © 2019 czm. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSError (Handle)

//新建error
+ (NSError *)errorWithDomain:(NSString *)domain
                        code:(NSInteger)code
                 description:(NSString *)description
               failureReason:(NSString *)failReason;
+ (NSError *)errorWithDomain:(NSString *)domain
                        code:(NSInteger)code
                 description:(NSString *)description;

//获取error信息
- (NSString *)getErrorDomain;
- (NSInteger)getErrorCode;
- (NSString *)getErrorDescription;
- (NSString *)getErrorReason;

@end

NS_ASSUME_NONNULL_END
