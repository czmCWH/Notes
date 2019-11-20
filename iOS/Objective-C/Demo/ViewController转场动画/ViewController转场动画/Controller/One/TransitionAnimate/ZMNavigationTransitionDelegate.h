//
//  ZMNavigationTransitionDelegate.h
//  ViewController转场动画
//
//  Created by czm on 2019/11/20.
//  Copyright © 2019 czm. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZMNavigationTransitionDelegate : NSObject<UINavigationControllerDelegate>

@property (nonatomic, assign)BOOL interactive;
@property (nonatomic, strong)UIPercentDrivenInteractiveTransition *interactiveTransition;

@end

NS_ASSUME_NONNULL_END
