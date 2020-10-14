//
//  Person.h
//  test
//
//  Created by czm on 2020/10/10.
//  Copyright © 2020 czm. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, copy)NSString *name;
@property (nonatomic, strong)NSNumber *age;
@property (nonatomic, strong)NSDate *birthday;

+ (instancetype)personWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
