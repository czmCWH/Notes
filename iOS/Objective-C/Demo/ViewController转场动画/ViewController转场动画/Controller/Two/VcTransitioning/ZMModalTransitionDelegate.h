//
//  ZMModalTransitionDelegate.h
//  ViewController转场动画
//
//  Created by czm on 2019/11/14.
//  Copyright © 2019 czm. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZMModalTransitionDelegate : NSObject<UIViewControllerTransitioningDelegate>

@property (nonatomic, assign)BOOL interactive;      // 是否允许手势交互转场
@property (nonatomic, strong)UIPercentDrivenInteractiveTransition *interactiveTransition;

@end

NS_ASSUME_NONNULL_END
