//
//  NSURL+Handle.m
//  工具类的使用
//
//  Created by czm on 2019/11/7.
//  Copyright © 2019 czm. All rights reserved.
//

#import "NSURL+Handle.h"

@implementation NSURL (Handle)

+ (NSURL *)URLWithStringOrNil:(NSString *)URLString {
    if (URLString) {
        return [NSURL URLWithString:URLString];
    }
    return nil;
}

- (BOOL) isEqualToURL:(NSURL*)otherURL {
    return [[self absoluteURL] isEqual:[otherURL absoluteURL]] ||
    ([self isFileURL] && [otherURL isFileURL] && [[self path] isEqual:[otherURL path]]);
}

@end
