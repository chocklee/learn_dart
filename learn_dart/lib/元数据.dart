// 自定义元数据注解
library todo;

@deprecated
class Todo {
  final String who;
  final String what;

  const Todo(this.who, this.what);
}

/// 使用元数据可以提供有关代码的其他信息。
/// 元数据注释以字符 @ 开头， 后跟对编译时常量 (如 deprecated) 的引用或对常量构造函数的调用
/// 对于所有 Dart 代码有两种可用注解：@deprecated 和 @override
class Television {
  @deprecated
  void activate() {
    turnOn();
  }

  void turnOn() {}
}

/// 元数据可以在 library、 class、 typedef、 type parameter、 constructor、 factory、
/// function、 field、 parameter 或者 variable 声明之前使用，也可以在 import 或者 export 指令之前使用。
/// 使用反射可以在运行时获取元数据信息。
