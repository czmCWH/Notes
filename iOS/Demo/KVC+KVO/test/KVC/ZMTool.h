//
//  ZMTool.h
//  test
//
//  Created by czm on 2020/10/9.
//  Copyright © 2020 czm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ZMPart.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZMTool : NSObject

@property (nonatomic)NSNumber *objCount;
@property (nonatomic, strong)ZMPart *part;
@property (nonatomic, strong)NSArray <UIColor *> *colors;
@property (nonatomic, strong)NSArray <NSNumber *>*days;

@end

NS_ASSUME_NONNULL_END
