//
//  OverlyPresentationController.m
//  ViewController转场动画
//
//  Created by czm on 2019/11/14.
//  Copyright © 2019 czm. All rights reserved.
//

#import "OverlyPresentationController.h"

@implementation OverlyPresentationController

- (void)containerViewWillLayoutSubviews {
    CGFloat W = self.containerView.frame.size.width * 2/3;
    CGFloat H = self.containerView.frame.size.height * 2/3;
    
    self.presentedView.center = self.containerView.center;
    self.presentedView.bounds = CGRectMake(0, 0, W, H);
}



//override func containerViewWillLayoutSubviews(){
//    dimmingView.center = containerView!.center
//    dimmingView.bounds = containerView!.bounds
//
//    let width = containerView!.frame.width * 2 / 3, height = containerView!.frame.height * 2 / 3
//    presentedView?.center = containerView!.center
//    presentedView?.bounds = CGRect(x: 0, y: 0, width: width, height: height)
//}

@end
