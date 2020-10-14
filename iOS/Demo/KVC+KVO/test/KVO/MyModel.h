//
//  MyModel.h
//  test
//
//  Created by czm on 2020/10/13.
//  Copyright © 2020 czm. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyModel : NSObject

@property (nonatomic, assign)CGFloat amount;
@property (nonatomic, strong)NSMutableArray *arr;
@property (nonatomic, strong)NSMutableDictionary *dict;

@end

NS_ASSUME_NONNULL_END
