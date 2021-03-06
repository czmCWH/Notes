//
//  NetworkStateOrRSSI.h
//  GHZeusLibraries
//
//  Created by 郭军 on 2017/12/2.
//  Copyright © 2017年 ZJBL. All rights reserved.
//
 
#import <Foundation/Foundation.h>
 
typedef enum {
    GHNetworkErrorType = 0,
    GHNetwork2GType = 1,
    GHNetwork3GType = 2,
    GHNetwork4GType = 3,
    GHNetworkWifiType = 5
}GHNetworkType;
 
@interface  NSObject (NetworkStateOrRSSI)
 
@property (assign, nonatomic) uint32_t  nowIBytes;  //当前每秒下行流量，KB
@property (assign, nonatomic) uint32_t  nowOBytes;  //当前每秒上行流量
 
+ (GHNetworkType)networkType;
 
+ (int)wifiStrengthBars;
 
//开始检测，需每秒调用一次该方法，使获得nowIBytes&nowOBytes
- (void)detectionBytes;
 
 
@end
