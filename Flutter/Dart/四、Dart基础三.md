# 四、Dart基础三

## 类

`Dart` 是一种基于类和 `mixin` 继承机制的面向对象的语言。每个对象都是一个类的实例，除`Null`之外的所有类都来自`Object`。 

基于 `mixin` 的继承意味着尽管每个类（除[top class](https://dart.dev/null-safety/understanding-null-safety#top-and-bottom) `Object?`之外）都只有一个超类，但是一个类主体可以在其他多个继承类中重复使用。[Extension methods](https://dart.dev/guides/language/language-tour#extension-methods)是一种在不更改类或创建子类的情况下向类添加功能的方法。

对象具有由函数和数据（分别为方法和实例变量）组成的成员。调用方法时，可以在对象上调用它：该方法可以访问该对象的函数和数据。

### 实例变量

* 所有未初始化的实例变量的值都为`null`。

* 所有实例变量都会生成一个隐式的`getter`方法。没有初始化器的 `Non-final` 和`late final`实例变量也会生成隐式的`setter`方法。 

* 实例变量可以是`final`。`final`的初始化：可以在声明`non-late`实例变量时、使用构造函数参数、构造函数的初始化列表时初始化：

```Dart
class Point {
  int? x;
  int? y;
  int z = 0;
  final String name = 'point';
}
```

* 使用 `.` 来引用实例对象的变量和方法；
* 使用 `?.` 来代替 `.` ， 可以避免因为左边对象可能为 `null` 导致的异常：

```Dart
Point? p = Point();
print('${p.x}');        // 打印：null

p = null;
print('${p?.z}');   // 打印：null
```

### 构造函数

可以使用构造函数创建对象。构造函数名称可以是`ClassName` 或 `ClassName.identifier`。

* 下面 `this` 表示引用当前实例；
* 仅当名称冲突时才使用 `this`。 否则，Dart样式将忽略 `this`。

```Dart
class Point {
  int? x;
  int? y;
  int z = 0;
  final String name = 'point';
  
  Point(int x, int y, int z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }
  
  // 通过语法糖来简写，与上面构造函数等价
//   Point(this.x, this.y, this.z);
}
```

#### 默认构造函数

如果未声明构造函数，`Dart` 会提供默认的构造函数。默认构造函数没有参数，并在超类中调用无参数构造函数。

#### 构造函数不被继承

子类不会继承父类的构造函数。 类不声明构造函数，那么它就只有默认构造函数 (没有参数，没有名称) 。

#### 命名构造函数

使用命名构造函数可为一个类实现多个构造函数，也可以使用命名构造函数来更清晰的表明函数意图：

```Dart
class Point {
  double x = 0;
  double y = 0;

  Point(this.x, this.y);

  // 命名构造函数
  Point.origin(){
    x = 0;
    y = 0;
  }
}

var p1 = Point(1, 2);
var p2 = Point.origin();

// `new` 关键字在 `Dart 2` 中成为可选关键字。
// var p3 = new Point(1, 2);
// var p4 = new Point.origin();
```

#### 调用父类非默认构造函数

默认情况下，子类中的构造函数会自动调用父类的 `匿名、无参数 的构造函数`。父类的构造函数在子类构造函数体开始执行的位置被调用。如果子类提供了一个`initializer list`(初始化参数列表)，它将在调用父类之前执行。执行顺序如下：

* 初始化参数列表
* 父类的无参数构造函数
* 主类的无参数构造函数

如果父类没有 `匿名、无参数 的构造函数`，则必须手动调用父类中的构造函数之一。 在当前构造函数冒号`:`之后，函数体之前，声明调用父类构造函数。如以下代码：

```Dart
class Animal {
  String? type;
  
  Animal.initStr(String name) {
    type = name;
  }
}

class Monkey extends Animal {
  var name = '';
  
  Monkey(String name): super.initStr('猴子') {
    this.name = name;
  }
}

var mk = Monkey('阿康');
print('${mk.name} ${mk.type}');   // 打印：阿康 猴子
```

#### 初始化列表

除了调用父类构造函数外，还可以在构造函数主体运行之前初始化实例变量。用逗号分隔初始化程序。

```Dart
class Point {
  int? x;
  int? y;
  
  // 注意：初始化程序的右侧无法访问 this 
  Point.fromJSON(Map<String, int> mp)
        : x = mp['x']!, y = mp['y'] {
    print('$x $y');
  }
}

var p1 = Point.fromJSON({"x": 10, "y": 20});
// 打印：10 20
```

* 使用初始化列表可以很方便的设置 `final` 属性

```Dart
class Point {
  final int x;
  final int y;
  int sum = 0;
  
  Point(int x, int y): x = x, y = y, sum = x*y {
    print('$x $y $sum');
  }
}

var p = Point(2, 3);        // 打印：2 3 6
```

#### 重定向构造函数

有时构造函数的唯一目的是重定向到同一个类中的另一个构造函数。 重定向构造函数的函数体为空，构造函数的调用在冒号 (:) 之后。

```Dart
class Point {
  double x, y;
  
  Point(this.x, this.y);
  
  // 委托给主要构造函数
  Point.inX(double x): this(x, 0);
}
```

#### 常量构造函数

如果你的类产生了永不改变的对象，那么就可以把这些对象定义为`compile-time constants`(编译时常量)。为此，需要定义`const` 构造函数，并确保所有实例变量都是 `final`。 

```Dart
class ConstPoint {
  static const ConstPoint origin = ConstPoint(0, 0);
  final double x, y;
  const ConstPoint(this.x, this.y);
}

print(ConstPoint.origin.x);     // 打印：0
```

> 常量构造函数创建的实例并不总是常量。

#### 工厂构造函数

* 当执行构造函数并不总是创建这个类的一个新实例时，请使用 `factory` 关键字。 

* 工厂构造函数无法访问 this。

* 工厂构造函数的使用场景：
例如，工厂构造函数可能从缓存返回一个实例，或者可能返回一个子类型的实例。工厂构造函数的另一个用例 是使用初始化列表中无法处理的逻辑来初始化最终变量。

### 方法

`Methods`(方法)是为对象提供行为的函数。

#### 实例方法

对象的实例方法可以访问 `this` 和实例变量。

```Dart
import 'dart:math';

const double xOrigin = 0;
const double yOrigin = 0;

class Point {
  double x = 0;
  double y = 0;

  Point(this.x, this.y);

  double distanceTo(Point other) {
    var dx = x - other.x;
    var dy = y - other.y;
    return sqrt(dx * dx + dy * dy);
  }
}
```

#### 运算符

`Operators`(运算符)是具有特殊名称的实例方法。 Dart允许使用以下名称定义运算符：

```
<	   +	  | 	  []
>	   /	  ^	  []=
<=	   ~/	  &	  ~
>=	   *	  <<	  ==
–	   %	  >>
```

> 某些运算符(例如：`!=`)不在如上列表中，因为它是语法糖，`e1 != e2 ` 等价于 `!(e1 == e2)`

```Dart
class Point {
  double x = 0;
  double y = 0;

  Point(this.x, this.y);

  Point operator +(Point p) {
    return Point(x + p.x, y + p.y);
  }
  
  Point operator -(Point p) => Point(x - p.x, y - p.y);
}

var p1 = Point(2, 4);
var p2 = Point(3, 7);

print('${(p1 + p2).x} ${(p2 - p1).y}');   // 打印：5 3
```

#### Getter 和 Setter

`getter` 和 `setter` 是提供对 对象属性的读写访问的特殊方法。每个实例变量都有一个隐式的`getter`，如果合适的话还有一个`setter`。 可以通过使用`get`和`set`关键字实现`getter`和`setter`来创建其他属性：

```Dart
class Rectangle {
  double x, y, width, height;
  
  Rectangle(this.x, this.y, this.width, this.height);
  
  double get right {
    return x + width;
  }
  
  set right(double value) {
    x = value - width;
  }
}

var rt = Rectangle(10, 10, 80, 80);
print('${rt.right}');   // 打印：90

rt.right = 100;
print('${rt.right} ${rt.x}');   // 打印：100 20
```

#### 抽象方法

实例方法、`getter`和`setter`方法可以是抽象的，只定义接口不进行实现，而是留给其他类去实现。抽象方法只能存在于 `abstract classes`(抽象类)中。

定义一个抽象函数，使用分号 (;) 来代替函数体：

```Dart
abstract class Doer {
  void doSomething(); // 定义一个抽象方法。
}

class EffectiveDoer extends Doer {
  void doSomething() {
    // 提供方法实现，所以这里的方法就不是抽象方法了...
  }
}
```

### Abstract classes

使用 `abstract` 修饰符定义一个`abstract class`(抽象类) --- 抽象类无法实例化。 

抽象类通常用来定义接口，以及部分实现。如果希望抽象类能够被实例化，请定义一个`factory constructor`(工厂构造函数)。

抽象类通常具有抽象方法。下面是一个声明具有抽象方法的抽象类的示例： 

```Dart
abstract class Dog {
  String speak();
}
```

### 隐式接口

每个类都隐式的定义了一个接口，该接口包含了该类所有的 实例成员 及其 实现的接口。如果要创建一个 A 类，A 要支持 B 类的 API ，但是不需要继承 B 的实现， 那么可以通过 A 实现 B 的接口。

一个类可以通过 `implements` 关键字来实现一个或者多个接口，并实现每个接口要求的 API。 例如：

如下 `Teach` 类的 `Implicit interfaces`(隐式接口) 包含实例成员 `subName` 和  `subject`，以及 `jobDescription` 接口：

```Dart
class Teach {
  final subName;
  String subject;
  
  Teach(this.subName, this.subject);
  
  String jobDescription() => "$subName teach $subject";
}
```

如下 `Person` 类实现 `Teach` 类的接口：

```Dart
class Person implements Teach {
  
  get subName => '机械工';
  String get subject => '机器控制';
  set subject(String value) { }
  
  String jobDescription() => "$subName direct $subject subjects";
}
```

由于 `Person` 实现了 `Teach` 的接口，所以可以当作 `Teach` 类型进行传递：

```Dart
void teachTest(Teach obj) {
  print(obj.jobDescription());
}

var t = Teach('老师', '数学');
teachTest(t);

var p = Person();
teachTest(p);
```

## 扩展类（继承）

使用 `extends` 创建一个子类，并使用 `super` 来引用父类：

子类可以覆盖实例方法(包括运算符)、`getter`和`setter`。可以使用 `@override` 批注指示您有意覆盖成员

定一个 `Animal` 子类：

```Dart
class Animal {
  String type;
  int age;
  
  Animal(this.type, this.age);
  
  void eat(String food) {
    print('eat $food');
  }
  
  void sport(String name) {
    print('sport $name');
  }
}
```

`Person`类继承自 `Animal`：

```Dart
class Person extends Animal {
  
  // 重写属性
  String get type => '高级动物';
  
  String name = '';
  
  // 构造函数
  Person(String name, String type, int age): super(type, age) {
    this.name = name;
  }
  
  // 重写方法
  void eat(String food) {
    super.eat(food);
    print('干饭人！');
  }
  
  @override
  void sport(String name) {
    print('我喜欢 $name 运动！');
  }
}
```

### noSuchMethod()
当在代码尝试使用不存在的方法或实例变量时，可以重写`noSuchMethod()`，来进行检测或作出反应。

```Dart
class A {
  @override
  void noSuchMethod(Invocation invocation) {
    print('You tried to use a non-existent member: ' +
        '${invocation.memberName}');
  }
}

dynamic a = A();
print(a.name);
// 打印：You tried to use a non-existent member: Symbol("name")
null
```

除非满足以下条件之一，否则您不能调用未实现的方法：

* `receiver` 具有`dynamic`的静态类型。

* `receiver` 具有静态类型，用于定义为实现的方法 (可以是抽象的), 并且 `receiver` 的动态类型具有 `noSuchMethod()` 的实现， 该实现与 `Object` 类中的实现不同。

有关更多信息，请参见[noSuchMethod forwarding specification](https://github.com/dart-lang/sdk/blob/master/docs/language/informal/nosuchmethod-forwarding.md)。

## 扩展方法

[Extension methods](https://dart.dev/guides/language/extension-methods)(扩展方法)是向现有库添加功能的一种方法。您可能会在不知情的情况下使用扩展方法。例如，当您在IDE中使用代码完成时，它建议使用扩展方法和常规方法。

```Dart
import 'string_apis.dart';

print('42'.padLeft(5)); 
print('42'.parseInt()); 
```

## Enumerated types

枚举类型也称为 `enumerations` 或 `enums` ， 是一种特殊的类，用于表示数量固定的常量值。

* 使用 `enum` 关键字声明枚举类型：

* 枚举中的每个值都有一个`index`获取器(`getter`)，它返回该值在枚举声明中从零开始的位置。

* 要获取枚举中所有值的列表，请使用枚举的 `values` 常量。

* 枚举类型具有以下限制： 枚举不能被子类化，`mixin`或`implements`。枚举不能被显式实例化。

```Dart
enum Color { red, green, blue }

print(Color.red.index);     // 打印：0

List<Color> colors = Color.values;
print(colors);      // 打印：[Color.red, Color.green, Color.blue]

var aColor = Color.red;
switch (aColor) {
  case Color.green:
    print('color is green');
    break;
  default:
    print(aColor);
    break;
}
```

## 为类添加功能：mixins

* `mixin`(混合) 是一种在多个类层次结构中重用类代码的方法。

* 要使用`mixin`，请使用`with`关键字，后跟一个或多个`mixin`名称。

* 通过创建一个继承自 `Object` 且没有构造函数的类，来实现 一个 `mixin`。如果 `mixin` 不希望作为常规类被使用，使用关键字 `mixin` 替换 `class` 。

```Dart
class Machine {
  bool isOil = false;
  
  void work() {
    print("使用机器工作");
  }
}

mixin Tool {
  List<String> some = ['铁锹', '锤子'];
  
  String giveTool() {
    String tools = '';
    for(var item in this.some) {
      tools += (item + ', ');
    }
    return tools;
  }
}
```

```Dart
class Worker with Machine, Tool {
  String name;
  Worker(this.name);
}

var w = Worker('工人');
w.work();       // 打印：使用机器工作
print('${w.giveTool()}');   // 打印：铁锹, 锤子, 
```

* 指定只有某些类型可以使用的 `Mixin`。

例如，Mixin 可以调用 Mixin 自身没有定义的方法。 如下例所示，通过使用`on`关键字指定所需的父类来限制 `mixin` 的使用：

```Dart
class A {
  void test() {
    print('begin test');
  }
}
mixin B on A {
  void build() {
    test();
    print('begin build');
  }
}

class Cc extends A with B { }

var c = Cc();
c.build();
// 打印：begin test     begin build
```

>  mixin 关键字在 Dart 2.1 中被引用支持。 早期版本中的代码通常使用 abstract class 代替。 


## 类变量和方法

使用 `static` 关键字实现类范围的 变量 和 方法。

### 静态变量

* 静态变量（类变量）对于类级别的状态是非常有用的。
* 静态变量只到它们被使用的时候才会初始化。

```Dart
class Queue {
  static var total = 16;
  static const name = 'main';
}
```


### 静态方法

* 静态方法（类方法）不能在实例上使用，因此它们不能访问 `this`。
* 静态方法（类方法）可以访问静态变量。
* 对于常见或广泛使用的工具和函数， 应该考虑使用顶级函数而不是静态方法。
* 静态函数可以当做编译时常量使用。 例如，可以将静态方法作为参数传递给常量构造函数。

```Dart
import 'dart:math';

class Point {
  double x, y;
  Point(this.x, this.y);
  
  static const double originX = 5, originY = 5;
  
  static double distance(Point p) {
    var dx = p.x - originX;
    var dy = p.y - originY;
    return sqrt(dx * dx + dy * dy);
  }
}

var p = Point(5, 100);
print('${Point.distance(p)}');    // 打印：95
```

## 泛型

在基本数组类型 `List` 实际上是 `List<E>`。 `<…>` 符号将 `List` 标记为 泛型(`generic`)（或参数化）类型，这种类型具有形式类型参数。通常情况下，使用一个字母来代表类型参数，例如 `E`，`T`，`S`，`K`和`V`。
 
在类型安全上通常需要泛型(`Generics`) 支持，它的好处不仅仅是保证代码的正常运行：

* 正确指定泛型类型可以提高代码质量。
* 使用泛型可以减少重复的代码。

如果打算仅包含字符串的列表，则可以将其声明为`List<String>`，读作“字符串类型的 list ”。 那么，当一个非字符串被赋值给了这个 list 时，开发工具就能够检测到这样的做法可能存在错误。：

```Dart
var ls = <String>[];
ls.add('xxx');
```

### 使用集合字面量

`List`、`Set` 和 `Map` 字面量也是可以参数化的。参数化字面量和之前的字面量定义类似， 下面是参数化字面量的示例：

```Dart
var ls = <String>['a', 'b', 'c'];
var st = <String>{'a', 'b', 'c'};
var mp = <String, int>{'a': 1, 'b':2};

print('${ls is List<String>} ${st is Set<String>} ${mp is Map<String,int>}');
// 打印：true true true
```

### 使用泛型类型的构造函数

`List<T>` 类型无法使用 `List<String>()` 来创建。

```Dart
//   var ls = List<String>();
var ls = <String>[];

var st = Set<String>();

var mp = Map<String, int>();
```

### 限制泛型类型

使用泛型类型的时候， 可以使用 `extends` 实现参数类型的限制。

```Dart
class Foo<T extends SomeBaseClass> {
  String toString() => "Instance of 'Foo<$T>'";
}

class SomeBaseClass { }
```

 
 
## 学习资源

[Dart 概述 * 英文](https://dart.dev/overview)

[in the library tour](https://dart.dev/guides/libraries/library-tour#future)

[Dart 编程语言概览 * 中文](https://www.dartcn.com/guides/language/language-tour)

[DartPad](https://dart.dev/tools/dartpad)