//
//  MyScalar.m
//  test
//
//  Created by czm on 2020/10/10.
//  Copyright © 2020 czm. All rights reserved.
//

#import "MyScalar.h"

@implementation MyScalar

- (BOOL)validateValue:(inout id  _Nullable __autoreleasing *)ioValue
               forKey:(NSString *)inKey
                error:(out NSError *__autoreleasing  _Nullable *)outError {
    return  false;
}

- (BOOL)validateValue:(inout id  _Nullable __autoreleasing *)ioValue
           forKeyPath:(NSString *)inKeyPath
                error:(out NSError *__autoreleasing  _Nullable *)outError {
    return  true;
}

@end
