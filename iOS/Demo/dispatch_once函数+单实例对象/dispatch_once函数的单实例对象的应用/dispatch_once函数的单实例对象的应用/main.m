//
//  main.m
//  dispatch_once函数的单实例对象的应用
//
//  Created by 陈正茂 on 16/3/18.
//  Copyright © 2016年 陈正茂. All rights reserved.
//



#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //实例化两个对象
        Person *tom = [Person sharedPerson];
        Person *jerron = [Person sharedPerson];
        NSLog(@"tom = %@, jerron = %@", tom, jerron);
        //由以下结果可以判断出,该类只能实例化一个对象
        /*
            tom = <Person: 0x100201a20>
         jerron = <Person: 0x100201a20>
         */
        NSLog(@"tom = %p, jerron = %p", tom, jerron);
        /*
            tom = 0x100201a20
         jerron = 0x100201a20
         */
    }
    return 0;
}
