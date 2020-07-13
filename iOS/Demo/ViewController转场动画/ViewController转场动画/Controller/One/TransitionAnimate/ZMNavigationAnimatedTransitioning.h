//
//  ZMNavigationAnimatedTransitioning.h
//  ViewController转场动画
//
//  Created by czm on 2019/11/20.
//  Copyright © 2019 czm. All rights reserved.
//

/**

UIViewControllerAnimatedTransitioning 协议中，定义了一组用于实现自定义视图控制器过渡的动画的方法。

该协议中的方法允许您定义一个动画对象，该对象创建动画以在固定的时间内在屏幕上或屏幕外转换视图控制器。
使用此协议创建的动画不能是交互式的。要创建交互式过渡，必须将动画师对象与另一个控制动画时间的对象结合在一起。

*/


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZMNavigationAnimatedTransitioning : NSObject<UIViewControllerAnimatedTransitioning>

- (instancetype)initWithType:(UINavigationControllerOperation)operation;

@end

NS_ASSUME_NONNULL_END
