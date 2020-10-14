//
//  MyBus.h
//  test
//
//  Created by czm on 2020/10/13.
//  Copyright © 2020 czm. All rights reserved.
//

#import "MyCar.h"
#import "MyModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyBus : NSObject

@property (nonatomic, copy)NSString *name;
@property (nonatomic, assign)NSInteger numberID;
@property (nonatomic, strong)NSArray *arr;

@end

NS_ASSUME_NONNULL_END
