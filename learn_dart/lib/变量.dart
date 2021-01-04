void variable() {
  // 变量
  var name = 'Bob'; // 变量仅存储对象引用，name变量的类型被推断为String
  // 如果对象不限定为单个类型，可以指定为 对象类型 或 动态类型
  dynamic name1 = 'Bob';
  // 显示声明
  String name2 = 'Bob';

  // 默认值 未初始化的变量默认值为null，即使变量是数字类型默认值也是 null，因为在 Dart 中一切都是对象
  int lineCount;
  // 在生产环境代码中 assert() 函数会被忽略，不会被调用。在开发过程中, assert(condition) 会在非 true 的条件下抛出异常
  assert(lineCount == null);

  // Final 和 Const 使用过程中从来不会被修改的变量，可以使用 final 或 const
  // Final 变量的值只能被设置一次；Const 变量在编译时就已经固定(Const变量是隐式Final的类型.)
  // 实例变量可以是 final 类型但不能是 const 类型。
  // 必须在构造函数体执行之前初始化 final 实例变量 —— 在变量声明中，参数构造函数中或构造函数的初始化列表中进行初始化。
  final name3 = 'Bob';
  final String nickname = 'Bobby';

  // name3 = 'Alice'; // Error: 一个 final 变量只能被设置一次。

  // 如果需要在编译时就固定变量的值，可以使用 const 类型变量
  // 如果 Const 变量是类级别的，需要标记为 static const。
  const bar = 1000000;
  const double atm = 1.01325 * bar;
  // Const 关键字不仅可以用于声明常量变量。 还可以用来创建常量值，以及声明创建常量值的构造函数。
  // 任何变量都可以拥有常量值。
  var foo = const [];
  final bar1 = const [];
  // 声明 const 的初始化表达式中 const 可以被省略
  const baz = []; // Equivalent to `const []`

  // 非 Final ， 非 const 的变量是可以被修改的，即使这些变量 曾经引用过 const 值。
  foo = [1, 2, 3];
  // baz = [42]; // Error: 常量变量不能赋值修改。
}
