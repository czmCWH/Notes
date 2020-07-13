/*
 \  续航符，表明 “下一行” 和本行算 “一行” 内容。
 
 ## 粘字符,即 "shared##Tom" <==> "sharedTom"
 
 */

/*
 *alloc方法内部,实际上就是直接调用allocWithZone,它的zone参数现在被废弃了
 *
 *在该.h文件中使用了dispatch_once函数,该函数代码块中block块只会被执行一次
 *
 *该.h文件就是定义了一个宏,我们在创建类是使用该宏,可以保证我们写的类创建出来的对象是单实例对象
 *
 *需要注意的是,宏定义的内容需要写在一行
 */

#define singleton_interface(class) \
+ (instancetype)shared##class;

// .m
#define singleton_implementation(class) \
static class *_instance; \
\
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        _instance = [super allocWithZone:zone]; \
    }); \
\
    return _instance; \
} \
\
+ (instancetype)shared##class \
{ \
    if (_instance == nil) { \
        _instance = [[class alloc] init]; \
    } \
\
    return _instance; \
}

