//
//  AppDelegate.m
//  ViewController转场动画
//
//  Created by czm on 2019/11/13.
//  Copyright © 2019 czm. All rights reserved.
//

#import "AppDelegate.h"
#import "ZMNavigationController.h"
#import "UIImage+Extension.h"
#import "HomeViewController.h"


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
    
    HomeViewController *v = [[HomeViewController alloc] init];
    ZMNavigationController *nav = [[ZMNavigationController alloc] initWithRootViewController:v];
    self.window.rootViewController = nav;
    
    return YES;
}


@end
