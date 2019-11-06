//
//  Person.h
//  dispatch_once函数的单实例对象的应用
//
//  Created by 陈正茂 on 16/3/18.
//  Copyright © 2016年 陈正茂. All rights reserved.
//

#import <Foundation/Foundation.h>
//导入单实例对象宏文件
#import "Singleton.h"
@interface Person : NSObject

//使用单例头文件中的声明文件
singleton_interface(Person);

//等价于
//+ (instancetype)sharedHuman;

@end
