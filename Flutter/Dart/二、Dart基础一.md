# 二、Dart基础一

在学习 `Dart` 之前，请牢记以下重要概念：

* 在 `Dart` 中，可以在变量中放置的所有内容都是一个对象，每个对象都是一个类的实例。偶数，函数和 `null` 都是对象。除 `null`（如果启用`sound null safety`）外，所有对象均从 `Object` 类继承。

* 尽管 `Dart` 是强类型的，但类型注解是可选的，因为`Dart`可以推断类型。 如下 a 和 b 均是 `int` 类型

```Dart
var a = 25; int b = 25;
print('$a $b');
```

* 如果启用`null safety`，变量不能包含`null`，除非你说可以。可以通过在变量类型的末尾添加 `?` 来使该变量可为空。

```Dart
// 变量c的类型为 int?，可以是整数，也可以为null
int? c = 25;
// 如果知道某个表达式永远不会取值为null，则可以添加！断言它不是null。如果为 null 则抛异常
int d = c!;
c = null;
print('$c $d');
// 打印：null 25
```

* 当你明确地说允许使用任何类型时，请使用`Object?`(如果你启用了`null safety`)、`Object`类型；如果必须将类型检查推迟到运行时，则用特殊类型`dynamic`。

```Dart
Object? obj = 12;
obj = "abc";
print('$obj');      // 打印：abc
```

* `Dart`支持泛型，如下定义存储整数的列表

```Dart
List<int> arr = [1, 2, 3];
print('$arr');
```

* `Dart`支持`top-level`函数(如：`main()`) 以及与类或对象绑定的函数(分别为静态方法和实例方法)。还可以在函数（嵌套或局部函数）中创建函数。

* 同样，`Dart`支持`top-level`变量 以及与类或对象关联的变量(静态变量和实例变量)。 实例变量有时称为字段或属性。

* 与`Java`不同，`Dart`没有关键字`public`，`protected`和`private`。如果标识符以下划线开头，则它是其库的专用标识符。

* 标识符可以以字母或下划线（_）开头，然后是这些字符加数字的任意组合。

* `Dart` 既有表达式(具有`runtime`值)又有语句(具有`runtime`值)。如，条件表达式 `condition ? expr1 : expr2`。 if-else语句。

* `Dart tools`可以报告两种问题：警告和错误。

## 变量

如下创建变量并对其进行初始化

```Dart
// 由于类型推断，Dart建议局部变量用 var 声明
// 名为`name`的变量 包含 对值为`'xiaoming'`的`String` 对象的引用。
var name = 'xiaoming';
// 类型注释，显式声明将要推断的类型
String str = 'xiaoming';
```

## 默认值

具有 可为空类型的未初始化变量 的初始值为 `null`。（如果你未选择使用`null safety`，则每个变量都具有可为`null`的类型。）即使数字类型的变量最初也为`null`，因为数字（如`Dart`中的所有其他内容）都是对象。

```Dart
int? age;
print(age == null);   // 打印：true

// 如果启用 `null safety`，则必须在使用非空变量之前 对其进行初始化：
int lineCount = 0;
```

不必在声明了该变量的地方初始化**局部变量**，但是你必须在使用它之前为其分配一个值。

```Dart
void test() {
  int x;
  // print($x);    // 会抛异常
  x = 20;
  print('$x');    // 打印：20
}
```

## late 变量

Dart 2.12添加了 `Late` 修饰符，它具有两个用例：
* 声明一个 在声明后初始化的 不可为`null`变量。
* 延迟(懒)初始化变量。

`Dart` 的控制流分析在使用非空变量之前，可以检测该变量何时设置为非null值，但有时分析会失败。常见的两种情况是`top-level`变量和实例变量：`Dart`通常无法确定是否设置了它们，所以它不会尝试分析。

```Dart
// 如果不使用late修饰，则编译不通过
late String glName;
void test() {
  // 如果未初始化glName，则会发生运行时错误
  glName = '姓名';
  print('$glName');
}
```

在变量声明时对其进行初始化时将变量标记为`late`，则初始化程序将在首次使用该变量时运行。这种延迟初始化在以下几种情况下非常方便：
* 可能不需要该变量，并且初始化它的成本很高。
* 你正在初始化实例变量，并且其初始化程序需要对此变量进行访问。

```Dart
late var sum = 10;
// do some ...
// 使用sum时，才会初始化
print('$sum');  // 打印：10
```

## final 和 const (常量)

如果从未打算更改变量，请使用`final`或`const`替代`var`，或放在类型注释的后面。`final`变量只能设置一次；`const`变量是编译时常量，`const`变量是隐式的`final`。`final top-level`变量 或 类变量在首次使用时被初始化。

> 实例变量可以是 `final` 变量，但不能是`const`变量。

```Dart
final name = "zhangsan";    // 没有类型修饰
final String subName;
subName = "lisi";       // 只能设置一次
```

对要用作`compile-time constants`(编译时常量)的变量使用`const`。如果`const`变量在类级别，则将其标记为`static const`。在声明变量的地方，将值设置为`compile-time constant`：

```Dart
const num = 10;
const int num2 = num * 10;
// const 变量只能定义时设置值，如下注释错误
//   const int num3;  
//   num3 = 100;
print('$num $num2');
```

`const`关键字不仅用于声明常量，还可以使用它来创建常量值，以及声明创建常量值的构造函数。任何变量都可以有一个常量值。

```Dart
var num = const [3];
print(num == [3]);    // 打印：false
num = [10];     // 即使变量原来接收一个常量，但仍然可以更改
final foo = const [3];
print("$foo");    // 打印：[3]
const bar = [];   // 相当于 `const []`
```

## 内置类型

`Dart`语言对以下各项具有特殊支持：

* `Numbers`(数值型：int、double)、
* `Strings`(`String`)、
* `Booleans`(`bool`)、
* `Lists`(`List`)、
* `Sets` (`Set`)、
* `Maps`(`Map`)、
* `Runes` (Runes; often replaced by the characters API)
* `Symbols` (`Symbol`)
* The value null (`Null`)

`Dart`支持使用`literal`创建对象的能力。如，`"a string"`是`string literal`，而`true`是`boolean literal`。

因为`Dart`中的每个变量都引用一个对象(即一个类的实例)，所以通常可以使用构造函数来初始化变量。一些内置类型具有自己的构造函数。如，可以使用`Map()`构造函数来创建`map`。

其他一些类型在 `Dart` 语言中也具有特殊作用：
* `Object`：是除 `Null` 外的所有`Dart`类的父类。
* `Future` 和 `Stream`：用于异步支持。
* `Iterable`：用于`for-in`循环和同步`generator functions`。
* `Never`：表示表达式永远无法成功完成计算。最常用于总是抛出异常的函数。
* `dynamic`：指示禁用静态检查，将类型检查推迟到运行时。通常应该使用`Object` 或 `Object?`代替。
* `void`：表示该值永远不会被使用。通常用作返回类型。

### Numbers

`Dart`数字有两种形式：

* `int`
整数值不大于64位，具体取决于平台。整数就是不带小数点的数字，如下：

```Dart
var x = 1;
var hex = 0xeeeeee;
print('$x $hex');   // 打印：1 15658734
```

* `double`
`IEEE 754`标准指定的64位（双精度）浮点数。如果数字包含小数点，则为 `double`

```Dart
var y = 1.1;
var exponents = 1.42e5;
print('$y , $exponents');   // 打印：1.1 , 142000
```

`int`和`double`都是 `num` 的子类型。[num](https://api.dart.dev/stable/2.12.2/dart-core/num-class.html) 类型包括基本运算符，如`+、-、/、*`等，在其方法中还有 `abs()`，`ceil()` 和 `floor()`。(在`int`类中定义了按位运算符，例如`>>`。) 如果`num`及其子类型没有您想要的内容，则[dart:math](https://api.dart.dev/stable/2.12.2/dart-math/dart-math-library.html)库可能会有。

* Numbers 和 字符串的转换

```Dart
var sInt = int.parse('10');
var iStr = 10.toString();

var sDouble = double.parse('1.23');
var dStr = 1.2233.toString();
var dPonitStr = 1.2233.toStringAsFixed(2);
```

* `Literal` numbers 是 `compile-time` 常量. 

```Dart
const msPerSecond = 1000;
```

### Strings

`Dart`字符串（即`String`对象）包含一系列UTF-16代码单元。可以使用 单引号 或 双引号 创建一个字符串：

```Dart
var s1 = "string string";
String s2 = 'string string';
```

* 字符串插值

可以使用 `${expression}` 将表达式的值放在字符串中。如果表达式是标识符，则可以省略`{}`。为了获取与对象相对应的字符串，`Dart`调用对象的`toString()`方法。 

```Dart
var pi = 3.14;
var s1 = 'start ${pi == 3.1416} to $pi end';
print(s1);    // 打印：start false to 3.14 end
```

* 使用 相邻的` string literals ` 或 `+`运算符来拼接字符串

```Dart
var s1 = 'a'"bb""ccc";
var s2 = 'a' "bb" "ccc";
var s3 = 'a'
"bb"
"ccc";
var s4 = 'a+bb' + 'ccc';
// == 运算符测试两个对象是否相等
print('${s1 == s2}, ${s2 == s3}, $s3, $s4');    // 打印：true, true, abbccc, a+bbccc
```

* 创建多行字符串：使用带 单引号或双引号的 三引号

```Dart
var s1 = '''
aaa
bbb
''';
var s2 = """ccc
ddd""";
print("$s1 $s2");
```

* 通过在原始字符串前加 `r` 来创建 `raw` 字符串

```Dart
 var s1 = r'aaa \n bbb';
print(s1);      // 打印：aaa \n bbb
var s2 = 'aaa \n bbb';
print(s2);
// aaa 
// bbb
```

* `Literal strings`(字面量字符串) 是 `compile-time constants`(编译时常量)，只要任何插值表达式是编译时常量，即其计算结果为 `null`、数字、`string`或 `boolean`。

### Booleans

`Dart`用名为 `bool` 的类型表示布尔值。只有两个对象具有布尔类型：`boolean literals` 的 `true` 和 `false`，它们都是`compile-time constants`(编译时常量)。

`Dart` 是 `type safety`(类型安全的)，因此不允许使用 `if (nonbooleanValue)` 或 `assert (nonbooleanValue)` 这样的代码，即需要像如下显示检查值：

```Dart
var res = true;
if (res) {
print('res is true');     // 打印：res is true
}
  
var s = '';
assert(s.isEmpty);
  
var pt = 0;
assert(pt <= 0);
  
Object? ber;
assert(ber == null);
  
var meant = 0 / 0;
assert(meant.isNaN);
```

### Lists

在`Dart`中，数组是`List`对象，因此大多数人都称其为列表。

```Dart
var ls1 = [1, 2, 3];
List<String> ls2 = [];
ls2.add('aa');
print('$ls1 $ls2');   // 打印：[1, 2, 3] [aa]
```

* 可以在`Dart`集合 `literal`的最后一项后面添加逗号。逗号结尾不会影响集合，但可以帮助防止复制粘贴错误。

```Dart
var ls1 = [1, 2, 3, ];
print(ls1);   // 打印：[1, 2, 3]
```

* 获取 `list` 的长度 和 索引

```Dart
var ls1 = [1, 2, 3];
print(ls1.length);    // 打印：3
print(ls1[0]);    // 打印：1
```

* 通过在 `list literal` 前面加 `const` 来创建 `compile-time constant` 的 `list`

```Dart
 var ls1 = const [1, 2, 3];
ls1[1] = 2;   // 运行错误，后续代码不会执行

const List ls2 = [1, 2, 3];
ls2[1] = 2;   // 运行错误，后续代码不会执行
```

* Dart 2.3引入了 `spread operator (...)` 和 `null-aware spread operator (...?)`，它们提供了将多个值插入到集合中的简洁方法。

使用 `spread operator (...)` 将一个 `List` 所有值插入到另一个 `List`：

```Dart
List ls1 = const [1, 2, 3];
var ls2 = [4, 5, 6, ...ls1];
print(ls2);   // 打印：[4, 5, 6, 1, 2, 3]
```

如果 `null-aware spread operator (...?)` 右边的表达式可能为null，则可以通过使用可识别null的扩展运算符（...？）来避免出现异常：

```Dart
List<int>? ls3;
print(ls3);   // 打印：null
  
List ls4 = [1, 2, 3, ...?ls3];
print(ls4);   // 打印：[1, 2, 3]
```

* `Dart` 提供了 `collection if` 和 `collection for`，可以使用 `conditionals (if)` 和 `repetition (for)` 来构建集合

```Dart
var res = true;
  
List<int> ls1 = [1, 2, 3, if (res) 123];
print(ls1);     // 打印：[1, 2, 3, 123]
```

```Dart
var ls2 = [1, 2, 3];
var ls3 = ['a', for (var i in ls2) "+$i"];
print(ls3);   // 打印：[a, +1, +2, +3]
```

### Sets

`Dart`中的 `Set` 是无序的、唯一项集合。 集文字和集类型为集提供Dart支持。

使用 `set literal` 创建 `set`：

```Dart
Set st1 = {'aa', 'bb', 'cc'};
print(st1);   // 打印：{aa, bb, cc}
```

创建一个空 `Set`:

```Dart
Set<String> st2 = {};
Set st3 = <String>{};
Set st4 = {};
  
print('$st2 $st3 $st4');   // 打印：{} {} {}
  
var st5 = {};   // 注意：这是创建一个 map，而不是 Set
```

* 使用 `add()` 或 `addAll()` 向 `Set` 中添加 item

```
var st0 = {'11', '22', '33'};
var st1 = <String>{};
Set st2 = {};
  
st1.add('aa');
st1.addAll(st0);
print(st1);   // 打印：{aa, 11, 22, 33}
  
st2.add(1);
st2.addAll(st0);
print(st2);   // 打印：{1, 11, 22, 33}

// 使用 length 获取item的个数
print('${st2.length}');   // 打印：4
```

* 创建 `compile-time constant`(编译时常量) `Set`

```Dart
final Set st1 = const {1, 4, 5};
//   st1.add(3);
  
const Set st2 = {1, 2, 3};
//   st2.add(4);
```

* `Set` 和 `List` 一样，都支持 `spread operators (... and ...?) ` 和 `collection if` 和 `for`.

```Dart
Set st1 = const {1, 4, 5};
Set<int> st2 = {3, 9, ...st1};
print(st2);   // 打印 {3, 9, 1, 4, 5}
  
Set<int>? st3;
var st4 = {9, 2, 12, ...?st3};
print(st4);   // 打印：{9, 2, 12}
```

```Dart
const res = false;
var st1 = {1, 2, 3, if (res == false) 6};
print(st1);   // 打印：{1, 2, 3, 6}
  
var st2 = {"a", "b", for (var i in st1) "+$i"};
print(st2);   // 打印：{a, b, +1, +2, +3, +6}
```

### Maps

`map`(映射)是`keys-values`关联的对象。 `keys`和`values`都可以是任何类型的对象。 每个`key`仅出现一次，相同的`value`可以使用多次。`Dart`对`maps`提供`map literals`和`map type`的支持。

* 通过 `map literals` 创建 `Map`

```Dart
var mp1 = {"s1": 1, "s2": 3};
var mp2 = {1: 1, 2: 3};
print("$mp1 $mp2");     // 打印：{s1: 1, s2: 3} {1: 1, 2: 3}
```

* 使用 `Map` 构造函数创建

```Dart
var mp1 = Map<String, int>();
mp1['s1'] = 10;
mp1['s2'] = 20;
print(mp1);     // 打印：{s1: 10, s2: 20}
```

* 从 `Map` 中检索值，`length`获取`Map`键值对的数量

```Dart
var mp = {'s1': 10, 's2': 20};
print('${mp['s1']} ${mp['s3']}');   // 打印：10 null
print(mp.length);   // 打印：2
```

* 在 `map literal` 前面加 `const` 来创建`compile-time constant` 的 `map`

```Dart
final mp = const {'s1': 10, 's2': 20};
```

* 和 `List` 一样，`Map`支持 `spread operators (... 和 ...?)` 以及 ` collection if 和 for`

```Dart
final mp = const {'s1': 10, 's2': 20};
var mp1 = {"s3": 30, ...mp};
print(mp1);   // 打印：{s3: 30, s1: 10, s2: 20}
  
Map<String, int>? mpp;
var mp2 = {"s3": 33, ...?mpp};
print(mp2);   // 打印：{s3: 33}
```

```Dart
const res = true;
var mp1 = {"23": "aa", if (res) "33": "bbb"};
print(mp1);     // 打印：{23: aa, 33: bbb}
```

## Runes 和 grapheme clusters

在`Dart`中，[runes](https://api.dart.dev/stable/2.12.2/dart-core/Runes-class.html)公开字符串的`Unicode code points`(码位)。可以使用[characters package](https://pub.dev/packages/characters)来查看或操作`user-perceived characters`(用户理解的字符)，也称为Unicode（扩展）` grapheme clusters`(字符簇)。

`Unicode`为世界上所有书写系统中使用的每个字母、数字和符号定义了唯一的数值。由于`Dart`字符串是`UTF-16`代码单元的序列，因此在字符串中表示`Unicode code points`需要特殊的语法。表示`Unicode code point`常用的方法是`\uXXXX`，其中`XXXX`是4位十六进制值。例如，字符（♥）为`\u2665`。要指定多于或少于4个十六进制数字，请将值放在大括号中。例如，笑的表情符号（😆）为`\u{1f606}`。

如果需要读取或编写单个`Unicode characters`，请使用`characters package`在`String`上定义的`characters getter`。返回的`Characters`对象是作为`grapheme clusters`序列的字符串。

有关使用`character package`操作字符串的详细信息，请参见`character package`的[example](https://pub.dev/packages/characters/example)和 [API reference](https://pub.dev/documentation/characters/latest/)。

如下characters API的示例：

```Dart
import 'package:characters/characters.dart';
...
var hi = 'Hi 🇩🇰';
print(hi);
print('The end of the string: ${hi.substring(hi.length - 1)}');
print('The last character: ${hi.characters.last}\n');
```

## Symbols

[Symbol](https://api.dart.dev/stable/2.12.2/dart-core/Symbol-class.html) 对象代表在 `Dart` 程序中声明的运算符或标识符。可能永远不需要使用`symbols`，但是`symbols`对于按名称引用标识符的API来说是非常宝贵的，因为最小化会更改标识符名称，但不会更改标识符符号。

要获取标识符的`symbol`号，请使用`symbol literal`，它只是`#`后跟标识符：：

`symbol literals` 是 `compile-time constants`。

```Dart
#radix
#bar
```


## 学习资源

[Dart 概述 * 英文](https://dart.dev/overview)

[Dart 编程语言概览 * 中文](https://www.dartcn.com/guides/language/language-tour)

[DartPad](https://dart.dev/tools/dartpad)