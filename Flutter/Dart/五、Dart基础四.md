# 五、Dart基础四

## 库和可见性

`import` 和 `library` 指令可以用来创建一个模块化的、可共享的代码库。 库不仅提供了 API ，而且对代码起到了封装的作用： 以下划线 `(_)` 开头的标识符仅在库内可见。 每个 `Dart` 应用程序都是一个库 ，即使它没有使用 `library` 指令。

可以使用 [packages](https://dart.dev/guides/packages) 分发库。

### 使用库

使用`import`指定在一个库的范围内如何使用一个库中的命名空间。 

例如，`Dart Web`应用程序通常使用[dart:html](https://api.dart.dev/stable/dart-html)库，可以像这样导入：

```Dart
import 'dart:html';
```

`import` 的唯一必需参数是指定库的URI，URI代表统一资源标识符。对于内置库，URI具有特殊的 `dart: scheme`。 对于其他库，可以使用系统文件路径或 `package: scheme`。`package: scheme`指定由包管理器（例如pub工具）提供的库。 例如：

```Dart
import 'package:test/test.dart';
```

### 指定库前缀

如果导入两个标识符冲突的库，则可以为一个或两个库指定一个前缀。例如，如果library1和library2都具有Element类，那么您可能具有以下代码：

```Dart
import 'package:lib1/lib1.dart';
import 'package:lib2/lib2.dart' as lib2;

// Uses Element from lib1.
Element element1 = Element();

// Uses Element from lib2.
lib2.Element element2 = lib2.Element();
```

### 导入库的一部分

如果只想使用一部分库，则可以有选择地导入该库。例如：

```Dart
// Import only foo.
import 'package:lib1/lib1.dart' show foo;

// Import all names EXCEPT foo.
import 'package:lib2/lib2.dart' hide foo;
```

### 延迟加载库

`Deferred loading`（也称为 `lazy loading`）允许`Web app`在需要库的时候按需加载库。 在某些情况下，您可能会使用延迟加载：

* 减少`Web app`的初始启动时间。
* 执行A/B测试，例如，尝试各种算法的 不同实现。
* 加载很少使用的功能，例如可选的屏幕和对话框。 

> 仅 `dart2js` 支持延迟加载。 Flutter，Dart VM 和 dartdevc 不支持延迟加载。

要延迟加载库，必须首先使用 `deferred as` 导入它。

```Dart
import 'package:greetings/hello.dart' deferred as hello;
```

当您需要该库时，请使用库的标识符调用`loadLibrary()`。

```Dart
Future greet() async {
  await hello.loadLibrary();
  hello.printGreeting();
}
```

上面代码中，`await` 关键字将暂停执行，直到加载该库为止。

可以在一个库上多次调用`loadLibrary()`，该库仅加载一次。

使用延迟加载时，请注意以下几点：

* 延迟库的常量不是导入文件中的常量。 请记住，在加载延迟的库之前，这些常量是不存在的。
* 在导入文件的时候无法使用延迟库中的类型。 如果你需要使用类型，则考虑把接口类型移动到另外一个库中， 让两个库都分别导入这个接口库。
* Dart 隐含的把 loadLibrary() 函数导入到使用 deferred as 的命名空间 中。 loadLibrary() 方法返回一个 Future。

## 异步支持

`Dart`库中包含许多返回`Future` 或 `Stream` 对象的函数。 这些函数是异步的：它们在设置可能耗时的操作（例如I / O）之后返回，而无需等待该操作完成。

使用 `async` 和 `await` 关键字实现异步编程。 可以让你像编写同步代码一样实现异步操作。

## 处理 Future

可以通过下面两种方式，获得 `Future` 执行完成的结果：

* 使用 `async` 和 `await`。
* 使用 `Future API`。

要使用 `await`，代码必须在 异步函数（即使用 `async` 标记的函数）中。使用 `async` 和 `await` 的代码是异步的，但是看起来很像同步代码。 

例如，下面是一些使用 `await` 等待异步函数结果的代码：

```Dart
Future checkVersion() async {
  var version = await lookUpVersion();
  // Do something with version
}
```

> 尽管`async`函数可能会执行耗时的操作，但它不会等待这些操作。`async`函数仅在遇到第一个`await`表达式时才会执行。也就是说，它返回一个`Future`对象，仅在`await`表达式完成后才恢复执行。可以在一个`async`函数中多次使用await。

使用 `try`， `catch`， 和 `finally` 来处理代码中使用 `await` 导致的错误。

```Dart
try {
  version = await lookUpVersion();
} catch (e) {
  // React to inability to look up the version
}
```

在 `await` 表达式中，表达式的值通常是一个 `Future`对象；如果不是，则该值会自动包装在`Future`中。 这个`Future`对象表示承诺返回一个对象。`await` 表达式 执行的结果为这个返回的对象。 `await` 表达式会阻塞代码的执行，直到需要的对象返回为止。

如果在使用 `await` 导致编译时错误， 确认 `await` 是否在一个异步函数中。

### 声明异步函数

异步函数是一个函数，其主体带有 `async` 修饰符。

将`async`关键字添加到函数将使其返回 `Future`。

如果函数没有返回有效值， 需要设置其返回类型为 `Future<void>`。

```Dart
Future<String> say() async {
  return 'you say';
}
```

### 处理 Stream

当需要从 `Stream` 中获取值时，有两种选择：

* 使用 `async` 和 异步for循环（`await for`）。
* 使用Stream API。

在使用 `await for` 前，确保代码清晰， 并且确实希望等待所有流的结果。 例如，通常不应该使用 `await for` 的UI事件侦听器， 因为UI框架会发送无穷无尽的事件流。



## 学习资源

[Dart 概述 * 英文](https://dart.dev/overview)

[in the library tour](https://dart.dev/guides/libraries/library-tour#future)

[Dart 编程语言概览 * 中文](https://www.dartcn.com/guides/language/language-tour)

[DartPad](https://dart.dev/tools/dartpad)