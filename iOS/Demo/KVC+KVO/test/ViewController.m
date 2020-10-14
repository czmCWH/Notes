//
//  ViewController.m
//  test
//
//  Created by czm on 2020/5/6.
//  Copyright © 2020 czm. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+HBD.h"
#import "OneViewController.h"

#import "ZMTool.h"
#import "Person.h"
#import "MyScalar.h"
#import "MyValidate.h"

#import "MyModel.h"

#import "MyBus.h"

#import "MyToy.h"

#import "Department.h"

// 标识KVO通知
static void *VCMyPersonAmountContext = &VCMyPersonAmountContext;

@interface ViewController ()

@property (nonatomic, strong)NSArray <Person *>*peoples;
@property (nonatomic, strong)NSArray <Person *>*boy;
@property (nonatomic, strong)NSArray <Person *>*girl;

@property (nonatomic, strong)MyModel *model;
@property (nonatomic, strong)MyBus *bus;
@property (nonatomic, strong)MyToy *toy;
@property (nonatomic, strong)Department *dept;


@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    self.hbd_barHidden = YES;
    
//    [self initdata];
    
//    [self registerKVO];
    
    
//    self.bus = [[MyBus alloc] init];
//    self.bus.name = @"新能源公交车";
//    [self.bus addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
//    [self.bus addObserver:self forKeyPath:@"arr" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
//    [self.bus addObserver:self forKeyPath:@"numberID" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    
    
    self.dept = [[Department alloc] init];
//    [self.dept addObserver:self forKeyPath:@"totalSalarys" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    
    self.dept.employees = @[[[Employee alloc] initWithSalary:@10], [[Employee alloc] initWithSalary:@20]];
    [self.dept.employees addObserver:self toObjectsAtIndexes:[NSIndexSet indexSetWithIndex:0] forKeyPath:@"salary" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    
}

- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSKeyValueChangeKey, id> *)change context:(nullable void *)context {
    NSLog(@"👍👍👍 %@, %@", keyPath, change);
}

#pragma mark - KVO
//- (void)manyRelationships {
//    self.dept = [[Department alloc] init];
//    [self.dept addObserver:self forKeyPath:@"totalSalarys" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
//}
//
//- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSKeyValueChangeKey, id> *)change context:(nullable void *)context {
//    NSLog(@"👍👍👍 %@, %@", keyPath, change);
//}

#pragma mark - KVO
- (void)oneRelationships {
    self.toy = [[MyToy alloc] init];
    MyCar *car = [[MyCar alloc] init];
    car.name = @"赛车";
    car.price = 50.5;
    self.toy.car = car;
    [self.toy addObserver:self forKeyPath:@"info" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
}
//- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSKeyValueChangeKey, id> *)change context:(nullable void *)context {
//    NSLog(@"👍👍👍 %@, %@", keyPath, change);
//}



#pragma mark - KVO
- (void)registerKVO {
    self.model = [[MyModel alloc] init];
    
    self.model.amount = 100;
    
    self.model.amount = 200;

    /// 1、向被观察对象注册观察者
    /// @param observer 观察者
    /// @param keyPath 被观察属性的Key-Path
    /// @param options 影响接收到通知中的change字典的内容 和 生成通知的方法。
    ///               New 和 Old 表示通知内容中包含新值和旧值；
    ///               Initial  表示被观察的对象在调用 addObserver 注册观察者方法返回之前立即发送通知，使得观察者能够获取被观察对象属性的初始值
    ///               Prior  表示被观察对象在属性更改前会发送一个预更改通知，然后再发送更改的常规通知。预更改通知的字典内容包括notificationIsPrior = 1。
    /// @param context 表示在属性更改通知中传递给观察者的数据。
    /// 通常，把context=nil，并在接受通知的方法里通过 keyPath 来确定通知的来源，但这会导致观察者的父类观察到相同的键路径而产生问题。因此，必要时可以通过定义 context 来确定通知的来源。
    /// 注意：addObserver：... 方法不会对观察者、被观察对象、context进行强引用
    [self.model addObserver:self forKeyPath:@"amount" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld | NSKeyValueObservingOptionPrior context:VCMyPersonAmountContext];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    self.model.amount = 102.23;
    
//    self.bus.arr = @[];
//    self.bus.numberID = 100;
    
//    self.toy.car.name = @"超人赛车";
    
//    self.dept.employees = @[[[Employee alloc] initWithSalary:@10], [[Employee alloc] initWithSalary:@20]];
    self.dept.employees.firstObject.salary = @1000;
}


/// 2、在观察者内部实现接收被观察对象属性发生更改的通知的方法
/// @param keyPath 触发通知的keyPath
/// @param object 被观察的对象
/// @param change 属性发生更改的信息，如果属性是对象，则直接提供值。如果属性是标量或C结构体，则值被包装在NSValue对象中。这和KVC一致。
/// @param context 注册观察者时提供的context
//- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSKeyValueChangeKey, id> *)change context:(nullable void *)context {
//
//    if (context == VCMyPersonAmountContext) {
//        NSLog(@"change = %@", change);
//
//        /*
//         1、当注册观察者的 options 参数为 Initial 时：
//         注册观察者前就打印输出：change = { "kind" : 1, "new" : 200 }
//         点击touch后更改通知： change = { "kind" : 1, "old" : 200, "new" : 102.23 }
//
//         2、当注册观察者的 options 参数为 Prior 时：
//         点击 touch 会打印输出两次：
//         先预更改通知：change = { "kind" : 1, "old" : 200, "notificationIsPrior" : true }
//         接着常规通知：change = { "kind" : 1, "old" : 200, "new" : 102.23 }
//         */
//
//    } else {
//        // 当无法识别通知时，意味着超类也已经注册了通知，需要调用父类的方法
//        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
//    }
//
//}

// 3、移除观察者
// 当观察者不需要接收通知时，至少需要在它释放之前，移除观察者
- (void)dealloc{
    // 如果删除未注册的观察者，则会导致NSRangeException异常
    [self.model removeObserver:self forKeyPath:@"amount" context:VCMyPersonAmountContext];
}

#pragma mark - KVC
- (void)testGetter {
    MyValidate *obj = [[MyValidate alloc] init];
    
    [obj setValue:@100 forKey:@"num"];
    NSLog(@"👉👉👉👉 %@", [obj valueForKey:@"num"]);
    
    NSLog(@"👉👉👉👉%@", [obj valueForKey:@"arr"]);
    
    NSLog(@"👉👉👉👉%@", [obj valueForKey:@"animal"]);
    
    
    NSLog(@"👉👉👉👉%@", [obj valueForKey:@"funName"]);
}


- (void)testValidate {
    MyValidate *obj = [[MyValidate alloc] init];
    NSError *error;
    NSString *value = @"tom";
    BOOL res = [obj validateValue:&value forKey:@"name" error:&error];
    if (res) {
        [obj setValue:value forKey:@"name"];
    }
    NSLog(@"%d, %@, %@, %@", res, value, error, [obj valueForKey:@"name"]);  // 1, admin, (null), admin
}

- (void)setupNonObject {
    MyScalar *scalar = [[MyScalar alloc] init];
    [scalar setValue:[NSNumber numberWithFloat:0.25] forKey:@"num"];
    NSNumber *num = [scalar valueForKey:@"num"];
    NSLog(@"%0.2f, %@", num.floatValue, [num class]);
    
    [scalar setValue:[NSNumber numberWithBool:false] forKey:@"result"];
    NSNumber *result = [scalar valueForKey:@"result"];
    NSLog(@"%d, %@", result.boolValue, [result class]);
    
    [scalar setValue:[NSValue valueWithCGPoint:CGPointMake(50.0, 50.0)] forKey:@"point"];
    NSValue *point = [scalar valueForKey:@"point"];
    NSLog(@"%@, %@", NSStringFromCGPoint(point.CGPointValue), [point class]);
    
    [scalar setValue:nil forKey:@"count"];
    NSNumber *count = [scalar valueForKey:@"count"];
    NSLog(@"😄 %@", count);     // 😄 (null)
    
    // [scalar setValue:nil forKey:@"total"];  // 抛异常Terminating app due to uncaught exception 'NSInvalidArgumentException'
    NSNumber *total = [scalar valueForKey:@"total"];
    NSLog(@"😭 %@", total);     // 😭 0
    
    ThreePoint three = {1.2, 2.2, 2.3};
    NSValue *value = [NSValue valueWithBytes:&three objCType:@encode(ThreePoint)];
    [scalar setValue:value forKey:@"threePt"];
    
    NSValue *threePt = [scalar valueForKey:@"threePt"];
    ThreePoint getThree;
    [threePt getValue:&getThree];
    NSLog(@"%0.2f, %0.2f, %0.2f, %@", getThree.x, getThree.y, getThree.z, [threePt class]);
}

- (void)initdata {
    self.peoples = @[[Person personWithDict:@{@"name":@"张三", @"age":@18, @"birthday":@"2001-02-22"}],
                     [Person personWithDict:@{@"name":@"李四", @"age":@22, @"birthday":@"2001-01-23"}],
                     [Person personWithDict:@{@"name":@"李四", @"age":@22, @"birthday":@"2001-01-23"}],
                     [Person personWithDict:@{@"name":@"赵六", @"age":@19, @"birthday":@"1998-03-23"}]
                    ];
    
    self.boy = @[[Person personWithDict:@{@"name":@"张三", @"age":@18, @"birthday":@"2001-02-22"}],
                  [Person personWithDict:@{@"name":@"李四", @"age":@22, @"birthday":@"2001-01-23"}],
                  [Person personWithDict:@{@"name":@"李四", @"age":@22, @"birthday":@"2001-01-23"}],
                  [Person personWithDict:@{@"name":@"赵六", @"age":@19, @"birthday":@"1998-03-23"}]
                ];
    
    self.girl = @[[Person personWithDict:@{@"name":@"小红", @"age":@18, @"birthday":@"2001-02-22"}],
                   [Person personWithDict:@{@"name":@"小红", @"age":@22, @"birthday":@"2001-01-23"}],
                   [Person personWithDict:@{@"name":@"小翠", @"age":@22, @"birthday":@"2001-01-23"}],
                   [Person personWithDict:@{@"name":@"小丹", @"age":@19, @"birthday":@"1998-03-23"}]
                ];
}


- (void)testNesting {
    
    NSArray *somePeople = @[self.boy, self.girl];
    
    NSArray *distinctArr = [somePeople valueForKeyPath:@"@distinctUnionOfArrays.birthday"];
    // 打印：去掉n个数组中重复：[1998-03-23, 2001-01-23, 2001-02-22]
    NSLog(@"去掉n个数组中重复：%@", distinctArr);

    NSArray *unionArr = [somePeople valueForKeyPath:@"@unionOfArrays.birthday"];
    // 打印：获取n个数组中所有：[2001-02-22, 2001-01-23, 2001-01-23, 1998-03-23, 2001-02-22, 2001-01-23, 2001-01-23,1998-03-23]
    NSLog(@"获取n个数组中所有：%@", unionArr);
}

- (void)testArray {
    NSArray *distinct = [self.peoples valueForKeyPath:@"@distinctUnionOfObjects.name"];
    NSLog(@"去掉重复：%@", distinct);  // 打印：去掉重复：["赵六", "张三", "李四"]

    NSArray *unionNames = [self.peoples valueForKeyPath:@"@unionOfObjects.name"];
    NSLog(@"获取所有：%@", unionNames);  // 打印：去掉重复：["张三", "李四", "李四", "赵六"]
}

- (void)testAggregation {
    
    NSNumber *average = [self.peoples valueForKeyPath:@"@avg.age"];
    NSLog(@"%@", average);  // 打印：20.25
    
    NSNumber *number = [self.peoples valueForKeyPath:@"@count"];
    NSLog(@"%@", number);  // 打印：4
    
    NSDate *max = [self.peoples valueForKeyPath:@"@max.birthday"];
    NSLog(@"%@", max);   // 打印： 2001-02-22
    
    NSDate *min = [self.peoples valueForKeyPath:@"@min.birthday"];
    NSLog(@"%@", min);   // 打印： 1998-03-23
    
    NSNumber *sum = [self.peoples valueForKeyPath:@"@sum.age"];
    NSLog(@"%@", sum);  // 打印：81
}

- (void)testTool {
    ZMTool *tool = [[ZMTool alloc] init];
    
    [tool setValue:@2 forKey:@"objCount"];
    [tool setValue:@[[UIColor blueColor], [UIColor redColor]] forKey:@"colors"];
    [tool setValue:[[ZMPart alloc] init] forKey:@"part"];
    [tool setValue:@"new_part" forKeyPath:@"part.name"];
    
    NSLog(@"%@, %@, %@", [tool valueForKey:@"objCount"], tool.colors, [tool valueForKeyPath:@"part.name"]);
    
    [tool setValuesForKeysWithDictionary:@{@"objCount": @12, @"colors":@[[UIColor yellowColor]]}];
    NSLog(@"%@", [tool dictionaryWithValuesForKeys:@[@"objCount", @"colors"]]);
    
    
    [tool setValue:@[@1, @2, @3] forKey:@"days"];
    NSLog(@"%@", [tool valueForKey:@"days"]);
    
    
    NSMutableArray *days = [tool mutableArrayValueForKey:@"days"];
    [days removeObject:@2];
    NSLog(@"%@", [tool valueForKey:@"days"]);
    
    
    [tool setValue:@[@"北京", @"河北"] forKeyPath:@"part.place"];
    NSLog(@"%@", [tool valueForKeyPath:@"part.place"]);
    
    NSMutableArray *mutPlace = [tool mutableArrayValueForKeyPath:@"part.place"];
    [mutPlace addObject:@"河南"];
    NSLog(@"%@", [tool valueForKeyPath:@"part.place"]);
}

@end
