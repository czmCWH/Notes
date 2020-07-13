//
//  NSError+Handle.m
//  工具类的使用
//
//  Created by czm on 2019/11/7.
//  Copyright © 2019 czm. All rights reserved.
//

#import "NSError+Handle.h"

@implementation NSError (Handle)

+ (NSError *)errorWithDomain:(NSString *)domain
                        code:(NSInteger)code
                 description:(NSString *)description {
    
    NSError *error = [NSError errorWithDomain:domain
                                          code:code
                                      userInfo:[NSDictionary dictionaryWithObjectsAndKeys:description,NSLocalizedDescriptionKey,nil]];
    return error;
}


+ (NSError *)errorWithDomain:(NSString *)domain
                        code:(NSInteger)code
                 description:(NSString *)description
               failureReason:(NSString *)failureReason {
    
    NSError *error = [NSError errorWithDomain:domain
                                         code:code
                                     userInfo:[NSDictionary dictionaryWithObjectsAndKeys:description, NSLocalizedDescriptionKey,
                                                                          failureReason, NSLocalizedFailureReasonErrorKey,nil]];
    return error;
}

- (NSString *)getErrorDomain{
    return [self domain];
}
- (NSInteger)getErrorCode{
    return [self code];
}
- (NSString *)getErrorDescription{
    return [self localizedDescription];
}
- (NSString *)getErrorReason{
    return [self localizedFailureReason];
}

@end
