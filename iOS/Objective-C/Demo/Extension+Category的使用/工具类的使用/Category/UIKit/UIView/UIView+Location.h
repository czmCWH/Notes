//
//  UIView+Location.h
//  工具类的使用
//
//  Created by czm on 2019/11/7.
//  Copyright © 2019 czm. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Location)

//self的subView的frame转换到目标view的frame
- (CGRect)convertSubview:(UIView *)subview toTargetView:(UIView *)targetView;

//把view在父视图的frame转换为self中的frame
- (CGRect)convertView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
