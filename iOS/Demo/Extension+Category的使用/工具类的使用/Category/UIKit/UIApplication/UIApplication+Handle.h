//
//  UIApplication+Handle.h
//  工具类的使用
//
//  Created by czm on 2019/11/7.
//  Copyright © 2019 czm. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, JYPrefsType) {
    JYPrefsSystemSetting = 0,   //系统设置页面
    JYPrefsWiFi,                //无限局域网
    JYPrefsBluetooth,           //蓝牙
    JYPrefsMobileData,          //蜂窝移动网络
    JYPrefsInternetTethering,   //个人热点
    JYPrefsCarrier,             //运营商
    JYPrefsNotification,        //通知
    JYPrefsGeneral,             //通用
    JYPrefsAbout,               //通用-关于本机
    JYPrefsKeyboard,            //通用-键盘
    JYPrefsAccessibility,       //通用-辅助功能
    JYPrefsInternational,       //通用-语言与地区
    JYPrefsWallpaper,           //墙纸
    JYPrefsSiri,                //Siri
    JYPrefsPrivacy,             //隐私
    JYPrefsSafari,              //Safari
    JYPrefsMusic,               //音乐
    JYPrefsPhotos,              //照片与相机
    JYPrefsFaceTime             //FaceTime
};

NS_ASSUME_NONNULL_BEGIN

@interface UIApplication (Handle)

// 应用程序之间跳转(如调起电话：tel://1234567890 )
+ (void)quickOpenURLString:(NSString *)urlString;

// 跳转到app设置页面
+ (void)goToAppSetting;

// 拨打电话
+ (void)goToTelephone:(NSString *)telephone;

// 跳转系统设置中相关功能的设置
+ (void)goToSettingWith:(JYPrefsType)prefsType;

@end

NS_ASSUME_NONNULL_END
