//
//  AppDelegate.m
//  transform形变
//
//  Created by czm on 2019/10/17.
//  Copyright © 2019 czm. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    UIViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateInitialViewController];
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = navVC;
    [self.window makeKeyAndVisible];
        
    return YES;
}


@end
