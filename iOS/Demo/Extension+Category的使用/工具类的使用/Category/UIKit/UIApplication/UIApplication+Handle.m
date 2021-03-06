//
//  UIApplication+Handle.m
//  工具类的使用
//
//  Created by czm on 2019/11/7.
//  Copyright © 2019 czm. All rights reserved.
//

#import "UIApplication+Handle.h"

@implementation UIApplication (Handle)

// 应用程序之间跳转
+ (void)quickOpenURLString:(NSString *)urlString{
    UIApplication *app = [UIApplication sharedApplication];
    NSURL *url = [NSURL URLWithString:urlString];
    if ([app canOpenURL:url]) {
        [app openURL:url];
    }
}


+ (void)goToAppSetting{
    [UIApplication quickOpenURLString:UIApplicationOpenSettingsURLString];
}

+ (void)goToTelephone:(NSString *)telephone{
    NSString *urlString = [@"tel://" stringByAppendingString:telephone];
    [UIApplication quickOpenURLString:urlString];
}

+ (void)goToSettingWith:(JYPrefsType)prefsType{
     NSArray *rootPaths  =  @[@"App-Prefs:root",
                              @"App-Prefs:root=WIFI",
                              @"App-Prefs:root=Bluetooth",
                              @"App-Prefs:root=MOBILE_DATA_SETTINGS_ID",
                              @"App-Prefs:root=INTERNET_TETHERING",
                              @"App-Prefs:root=Carrier",
                              @"App-Prefs:root=NOTIFICATIONS_ID",
                              @"App-Prefs:root=General",
                              @"App-Prefs:root=General&path=About",
                              @"App-Prefs:root=General&path=Keyboard",
                              @"App-Prefs:root=General&path=ACCESSIBILITY",
                              @"App-Prefs:root=General&path=INTERNATIONAL",
                              @"App-Prefs:root=Wallpaper",
                              @"App-Prefs:root=SIRI",
                              @"App-Prefs:root=Privacy",
                              @"App-Prefs:root=SAFARI",
                              @"App-Prefs:root=MUSIC",
                              @"App-Prefs:root=Photos",
                              @"App-Prefs:root=FACETIME"];
    
    NSString *urlString = [rootPaths objectAtIndex:(NSUInteger)prefsType];
    [UIApplication quickOpenURLString:urlString];
}


@end
