//
//  AppDelegate.m
//  test
//
//  Created by czm on 2020/5/6.
//  Copyright © 2020 czm. All rights reserved.
//

#import "AppDelegate.h"

#import "HBDNavigationController.h"
#import "UIViewController+HBD.h"
#import "HBDNavigationBar.h"

#import "ViewController.h"

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
    
    ViewController *vc = [[ViewController alloc] init];
    self.window.rootViewController = [[HBDNavigationController alloc] initWithRootViewController:vc];
    
    return YES;
}



@end
