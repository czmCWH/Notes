# 三、Dart基础二

## Functions

`Dart`是一种真正的面向对象的语言，因此函数也是对象，并且具有类型[Function](https://api.dart.dev/stable/2.12.2/dart-core/Function-class.html)。这意味着可以将函数分配给变量，也可以将其作为参数传递给其他函数。可以将`Dart`类的实例当作函数来调用。 

如下简单定义函数的例子，

```Dart
int addInt(int a, int b) {
  return a + b;
}

// 对于仅包含一个表达式的函数，可以使用箭头语法。
// 注意：箭头（=>）和分号（;）之间只能出现一个表达式，而不是一条语句。
int addInt(int a, int b) => a + b; 

print(addInt(10, 20));      // 打印：30
```

* 所有函数都会返回一个值。如果没有明确指定返回值，函数体会被隐式的添加 `return null;` 语句。



### Functions 的参数

函数可以具有任意数量的`required positional parameters`(必需位置参数)。这些后面可以跟`named parameters`(命名参数) 或 `optional positional parameters`(可选的位置参数)（但不能两者都有）。

如下定义`required positional parameters`(必需位置参数)：

```Dart
void doSome(int n, String? say) {
   print('$n -- $say');
}

doSome(10, 'hello');        // 打印：10 -- hello
// doSome(10); 会报错，必须 doSome(10, null); 这样调用
```

#### `named parameters`

`named parameters`(命名参数)是`optional`(可选的)，除非已将其明确标记为`required`(必需的)。定义函数时，请使用 `{param1，param2，…}` 指定命名参数。 

如下定义命名参数：

```Dart
void test({int? param1, String? param2, List<int>? param3}) {
  print('$param1 $param2 $param3');
}

test(param1: 10, param2: 'ABC', param3: [1,2,3]);
test(param1: 10, param2: 'ABC');
// 打印：
// 10 ABC [1, 2, 3]
// 10 ABC null
```

```Dart
void doSome(int n, String? say, {int? a}) {
   print('$n -- $say -- $a');
}

doSome(10, 'hello', a: 10);     // 打印：10 -- hello -- 10
doSome(10, null);       // 打印：10 -- null -- null
```

尽管`named parameters`(命名参数)是一种可选参数，但是您可以使用`required`对其进行注释，以表明该参数是强制性的，用户必须为该参数提供一个值。 例如：

```Dart
void test({int? param1, String? param2, required List<int> param3}) {
  print('$param1 $param2 $param3');
}
```

#### Optional positional parameters

将一组函数参数包装在`[]`将它们标记为`optional positional parameters`(可选的位置参数)：

```Dart
String saySome(bool res, [String? some]) {
  if (res) {
    if (some != null) {
      return '$some 哈哈';
    } else {
      return 'no some';
    }
  } else {
    return 'xxxxxx';
  }
}

print(saySome(true));       // 打印：no some
print(saySome(true, 'abc'));        // 打印：abc 哈哈
```

#### Default parameter values

定义函数时，可以使用 `=` 来定义`named parameters`(命名参数)和`positional parameters`(位置参数)的默认值。默认值必须是 `compile-time constants`(编译时常量)。如果未提供默认值，则默认值为`null`。

* 如下给 `named parameters`(命名参数) 设置默认值：

```Dart
void test({int? param1, String param2 = "abc"}) {
  print('$param1 $param2');
}

test(param1: 12);       // 打印：12 abc
test(param1: 12, param2: "ABC");        // 打印：12 ABC
```

* 如下给 `positional parameters`(命名参数) 设置默认值：

```Dart
String saySome(bool res, [String some = "zhangsan"]) {
  if (res) {
      return '$some 哈哈';
  } else {
    return 'xxxxxx';
  }
}

print(saySome(true));       // 打印：zhangsan 哈哈
print(saySome(true, 'abc'));        // 打印：abc 哈哈
```

```Dart
void saySome({List<String> param1 = const ["aa", "bb"], Map<String, int> param2 = const {"a": 1, "b": 2}}) {
  print('$param1\n$param2');
}

saySome();
// 打印：
// [aa, bb]
// {a: 1, b: 2}
```

### main() 函数

每个应用程序都必须具有顶级 `main()` 函数，该函数充当该应用程序的入口点。`main()` 函数返回 `void`，并具有可选的 `List<String>` 参数作为参数。

如下是一个简单的 `main()` 函数：

```Dart
void main() {
  print('Hello, World!');
}
```

如下是一个带有参数的命令行应用程序的`main()`函数示例：

```Dart
void main(List<String> arguments) {
  print(arguments);
}
```

### 函数是一等对象

可以将一个函数作为参数传递给另一个函数：

```Dart
void printElement(int element) {
  print(element);
}

var list = [1, 2, 3];
list.forEach(printElement);
```

可以将函数分配给变量：

```Dart
var funcSum = (int a, int b) => a * b;
print(funcSum(10, 20));     // 打印：200
```

### Anonymous functions

大多数函数都是命名的，`Dart`中还可以创建一个名为`anonymous function`(匿名函数)的无名函数，有时也可以创建一个`lambda`或`closure`(闭包)。可以将 匿名函数 分配给变量，以便例如，可以从集合中添加或删除它。

`anonymous function`(匿名函数)看起来类似于命名函数——括号之间有零个或多个参数，以逗号和可选的类型注释分隔。如下所示：

```Dart
([[Type] param1[, …]]) { 
    // 函数主体
}; 
```

```Dart
var fun = (bool res, String msg) {
  return res ? msg : 'aaa';
};
print(fun(true, "czm"));
```

### Lexical scope

`Dart`是一种`lexically scoped`(词法作用域)的语言，这意味着变量的范围是静态确定的，简单说变量的作用域在编写代码的时候就已经确定了。可以“向外跟随花括号”以查看变量是否在范围内。

下面是一个在每个作用域级别具有变量的嵌套函数的示例：

```Dart
bool topLevel = true;

void main() {
  var insideMain = true;

  void myFunction() {
    var insideFunction = true;

    void nestedFunction() {
      var insideNestedFunction = true;

      assert(topLevel);
      assert(insideMain);
      assert(insideFunction);
      assert(insideNestedFunction);
    }
  }
}
```

注意`nestedFunction()`可以访问所有的变量， 一直到顶级作用域变量。

### Lexical closures

`closure`(闭包) 是可以在其词法范围内访问变量的 `function object`(函数对象)，即使该函数在其原始范围之外使用。

函数可以封闭定义到它作用域内的变量。在下面的示例中，`makeAdder()`捕获变量`addBy`。 无论返回的函数到哪里，它都会记住`addBy`。


```Dart
/// 返回一个函数，返回的函数参数与 [addBy] 相加。
Function makeAdder(num addBy) {
  return (num i) => addBy + i;
}

// 创建一个加 2 的函数。
var add2 = makeAdder(2);

// 创建一个加 4 的函数。
var add4 = makeAdder(4);

print(add2(2));   // 打印：4
print(add4(2));   // 打印：6
```

## Operators 运算符

### 算数运算符

```Dart

print(5 / 2);       // 除法：2.5
print(5 ~/ 2);      // 除法 取整：2
print(5 % 2);       // 取余

// Dart 还支持前缀和后缀，自增和自减运算符。
var a = 10;
var b = a++;
  
var a2 = 10;
var b2 = ++a2;
  
print('b = $b, b2 = $b2');    // b = 10, b2 = 11
```

### 关系运算符

要测试两个对象x和y是否表示同一事物，请使用`==`运算符。(在极少数情况下，需要知道两个对象是否是完全相同的对象，请改用 [identical()](https://api.dart.dev/stable/2.12.2/dart-core/identical.html) 函数。）

`==` 运算符的工作原理如下：

1、如果x或y为null，则如果两个均为null，则返回true；如果只有一个为null，则返回false。

2、结果为函数 `x.==(y)` 的返回值。 (如上所见, `==` 运算符执行的是第一个运算符的函数。 我们甚至可以重写很多运算符，包括 `==`， 运算符的重写，参考 [重写运算符](https://dart.dev/guides/language/language-tour#_operators)。）

### 类型判断运算符

`as， is， 和 is!` 运算符用于在运行时处理类型检查。

仅当您确定该对象属于该类型时，才使用`as`运算符将其转换为特定类型。通常，可以认为`as`是 is 类型判定后，被判定对象调用函数的一种缩写形式。如下代码：

```Dart
if (emp is Person) {
  // Type check
  emp.firstName = 'Bob';
}
```

```Dart
(emp as Person).firstName = 'Bob';
```

> 注意以上代码不是等效的。如果employee为null或不是Person，则第二个示例抛出异常；第一个示例不执行任何操作。

### 赋值运算符

可以使用`=`运算符分配值。只有当被赋值的变量为 null 时才会赋值给它，请使用 `??=` 运算符。

```Dart
var a = 100;
int? b = 10;

b ??= a;
print(b);   // 10
  
b = null;     // 只有当b为null时，才会进行赋值
b ??= a;
print(b);   // 100
```

### 条件表达式

`Dart`有两个运算符，有时可以替换 `if-else` 表达式，让表达式更简洁：

```Dart
condition ? expr1 : expr2
```

* 如果条件为true，则计算expr1（并返回其值）；否则，计算并返回expr2的值。

```Dart
var visibility = isPublic ? 'public' : 'private';
```


```Dart
expr1 ?? expr2
```

* 如果`expr1`为非null，则返回其值；否则，计算并返回expr2的值。

```Dart
String playerName(String name) => name ?? 'Guest';
```

### 级联运算符 (..)

级联(`..`，`?..`）允许对同一对象执行一系列操作。除了函数调用，还可以访问同一对象上的字段。这通常可以节省创建临时变量的步骤，并允许您编写更多流畅的代码。

如果级联操作的对象可以为null，则对于第一个操作，请使用一个`null-shorting cascade`(null短路级联)`?..`。 以`?..`开头的内容可保证不会对该空对象尝试任何级联操作。`?..`是`2.12`版本引入的。

```Dart
querySelector('#confirm') // Get an object.
  ?..text = 'Confirm' // Use its members.
  ..classes.add('important')
  ..onClick.listen((e) => window.alert('Confirmed!'));
```

> 严格来说，级联的`..`符号不是运算符。 它只是`Dart`语法的一部分。

### 其它运算符

* `.` 运算符，用于引用表达式的属性，例如：foo.bar从表达式foo中选择属性

* `?.`运算符，类似于 `.`运算符，但其最左边的操作数可以为`null`，若为 `null` 则返回 `null`

## 控制流程语句

可以使用以下任意一种方式控制`Dart`代码的流程：

* if and else
* for loops
* while and do-while loops
* break and continue
* switch and case
* assert

## Exceptions异常

`Dart`代码可以抛出和捕获`exception`(异常)。异常表示一些未知的错误情况。如果未捕获到异常，则异常会抛出，导致抛出异常的代码终止执行。

与`Java`相比，`Dart`的所有异常都是未经检查的异常。方法不会声明它们可能引发哪些异常，也不要求捕获任何异常。

`Dart`提供了`Exception`和`Error`类型，以及许多预定义的子类型。当然你可以定义自己的异常。 但是，Dart程序可以将任何非`null`对象（不仅仅是`Exception`和`Error`对象）作为异常抛出。

### throw

如下是抛出异常的示例，生产环境代码通常会实现 [Error](https://api.dart.dev/stable/2.12.2/dart-core/Error-class.html) 或 [Exception](https://api.dart.dev/stable/2.12.2/dart-core/Exception-class.html) 类型的异常抛出。

```Dart
void test(int a) {
  switch (a) {
    case -1:
      // 抛出 exception 异常
      throw FormatException('a 不能为 -1');
    case 0:
      throw 'a 不能为 0';    // 可以抛出任意对象
    case 100:
      throw UnimplementedError();
    default:
      print('num is $a');
      break;
  }
}

test(66);   // 打印：num is 66
test(-1);
test(0);
test(100);
test(99);   // 不会打印 （由于上面代码抛出异常）
```

抛出异常是一个表达式，所以可以在`=>`语句以及允许表达式的其他任何地方抛出异常：

```Dart
void distanceTo(Point other) => throw UnimplementedError();
```

### catch

捕获异常会阻止该异常的传播（除非您重新抛出该异常）。可以通过捕获异常的机会来处理该异常：

```Dart
try {
  test(-1);
  // 使用 on 来指定异常类型， 使用 catch 来 捕获异常对象。
  // e为引发的异常对象，s为堆栈信息
} on Exception catch (e, s) {
  print('Exception details: $e');     
  print('Stack trace:\n $s');
}

test(99);       // 异常被捕获，函数会继续执行
// 打印：
// Exception details: FormatException: a 不能为 -1
// num is 99
```

```Dart
try {
  test(100);
} on Error catch (e) {
  print(e);     // 打印：UnimplementedError: a 不能为 100
}
```

```Dart
try {
  test(0);
} on Exception catch (e) {
  print(e);
} catch (e, s) {   // 处理任意类型
  print('$e - ${e.runtimeType}');       // 打印：a 不能为 0 - String
}
```

* 如果仅需要部分处理异常， 那么可以使用关键字 `rethrow` 将异常重新抛出。

```Dart
try {
  test(-1);
} on Exception catch (e) {
  print(e);   // FormatException: a 不能为 -1
  rethrow;
} 
test(99);   // 不会打印，因为异常被重新抛出了
```

### finally

为确保某些代码无论是否引发异常都可以运行，请使用`finally`子句。 如果没有`catch`子句与该异常匹配，则在`finally`子句运行后传播该异常：

* 如下代码未抛出异常，`finally`子句也会执行：

```Dart
try {
  test(66);
} finally {
  print('xxxxx'); 
} 

test(99);   
// 打印：
// xxxxx
// num is 99
```

* 如下代码异常被捕获，`finally`子句也会执行：

```Dart
try {
  test(-1);
} on Exception catch (e) {
  print(e); 
} finally {
  print('xxxxx'); 
} 
test(99); 

// 打印：  
// FormatException: a 不能为 -1
// xxxxx
// num is 99
```

* 如下代码异常未被捕获，异常会在 finally 执行完成后，再次被抛出：

```Dart
try {
  test(-1);
} finally {
  print('xxxxx'); 
} 
test(99);   // 不会执行
// 打印：
// xxxxx
```

## 学习资源

[Dart 概述 * 英文](https://dart.dev/overview)

[Dart 编程语言概览 * 中文](https://www.dartcn.com/guides/language/language-tour)

[DartPad](https://dart.dev/tools/dartpad)