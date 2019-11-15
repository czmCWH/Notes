//
//  AppDelegate.m
//  UITabBarController的使用
//
//  Created by czm on 2019/11/15.
//  Copyright © 2019 czm. All rights reserved.
//

#import "AppDelegate.h"

#import "ZMTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    
    if (@available(iOS 9.0, *)) {
        self.window.rootViewController = [[UIViewController alloc] init];
    }
    
    ZMTabBarController *tabBarVc = [[ZMTabBarController alloc] init];
    self.window.rootViewController = tabBarVc;
    
    return YES;
}

@end
