//
//  UIWindow+Info.m
//  工具类的使用
//
//  Created by czm on 2019/11/7.
//  Copyright © 2019 czm. All rights reserved.
//

#import "UIWindow+Info.h"

@implementation UIWindow (Info)

+ (UIViewController *)getCurrentPresentedVC{
    
    UIWindow *keywindow = [[[UIApplication sharedApplication] delegate] window];
    UIViewController *topVC = keywindow.rootViewController;
    
    while (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    return topVC;
}

+ (UIViewController *)getCurrentVC{
    UIViewController *currentViewController = [UIWindow getCurrentPresentedVC];
    
    while ([currentViewController isKindOfClass:[UINavigationController class]]
           && [(UINavigationController *) currentViewController topViewController]) {
        
        currentViewController = [(UINavigationController *) currentViewController topViewController];
    }
    
    return currentViewController;

}

@end
