//
//  MyToy.h
//  test
//
//  Created by czm on 2020/10/13.
//  Copyright © 2020 czm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyCar.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyToy : NSObject

@property (nonatomic, strong)MyCar *car;
@property (nonatomic, copy)NSString *info;

@end

NS_ASSUME_NONNULL_END
