//
//  ThreeAnimator.m
//  ViewController转场动画
//
//  Created by czm on 2019/11/19.
//  Copyright © 2019 czm. All rights reserved.
//

#import "ThreeAnimator.h"
#import "ThreePresentationController.h"

@implementation ThreeAnimator

- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(nullable UIViewController *)presenting sourceViewController:(UIViewController *)source {
    return [[ThreePresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
}

@end
