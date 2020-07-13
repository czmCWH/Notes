//
//  OneViewController.h
//  ViewController转场动画
//
//  Created by czm on 2019/11/13.
//  Copyright © 2019 czm. All rights reserved.
//

#import "ZMBaseViewController.h"
#import "ZMNavigationTransitionDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface OneViewController : ZMBaseViewController

@property (nonatomic, strong)ZMNavigationTransitionDelegate *transitionDelegate;

@end

NS_ASSUME_NONNULL_END
