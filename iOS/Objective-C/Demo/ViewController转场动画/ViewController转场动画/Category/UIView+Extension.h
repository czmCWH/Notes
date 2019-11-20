//
//  UIView+Extension.h
//  ViewController转场动画
//
//  Created by czm on 2019/11/19.
//  Copyright © 2019 czm. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Extension)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;


@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

@property (nonatomic, assign)CGFloat maxX;      /**< 最大x */
@property (nonatomic, assign)CGFloat maxY;      /**< 最大y */

@property (nonatomic, copy, readonly)NSString *frameStr;


/// 获取当前view所在的VC
- (UIViewController*)viewController;

@end

NS_ASSUME_NONNULL_END
