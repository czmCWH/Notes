//
//  NSURL+Handle.h
//  工具类的使用
//
//  Created by czm on 2019/11/7.
//  Copyright © 2019 czm. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSURL (Handle)

//创建一个url
+ (NSURL *)URLWithStringOrNil:(NSString *)URLString;
//url是否相同
- (BOOL) isEqualToURL:(NSURL*)otherURL;

@end

NS_ASSUME_NONNULL_END
