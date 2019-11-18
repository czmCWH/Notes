//
//  ZMTabBarAnimatedTransitioning.h
//  UITabBarController的使用
//
//  Created by czm on 2019/11/15.
//  Copyright © 2019 czm. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    TabBarVcChangeDirectionLeft,
    TabBarVcChangeDirectionRight,
} TabBarVcChangeDirection;

@interface ZMTabBarAnimatedTransitioning : NSObject<UIViewControllerAnimatedTransitioning>

- (instancetype)initWithDirection:(TabBarVcChangeDirection)direction;

@end

NS_ASSUME_NONNULL_END
