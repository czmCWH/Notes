//
//  Person.m
//  dispatch_once函数的单实例对象的应用
//
//  Created by 陈正茂 on 16/3/18.
//  Copyright © 2016年 陈正茂. All rights reserved.
//

/** 实现Person对象为单例对象 */
#import "Person.h"

@implementation Person

singleton_implementation(Person);

/*由于使用了上面的单例对象头文件(宏定义文件),替代了下面的所有方法

//语法层面上,oc中没有类变量.在oc中,静态的全局变量往往在扮演类变量的角色
static Person *_instance;


//alloc方法内部,实际上就是直接调用allocWithZone,它的zone参数现在被废弃了
+ (id)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    //保证Person类只能创建一个实例对象
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}
//一般实例化单例对象都是"shared##类名"或"default##类名"
+ (instancetype)sharedPerson{
    if(_instance == nil){
        _instance = [[Person alloc]init];
    }
    return _instance;
}
 */
@end
